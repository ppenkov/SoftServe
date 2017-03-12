using HRManagement.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace HRManagement.Controllers
{
    public class TeamLeadersController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the Team Leaders
        public ActionResult Index()
        {
            var teamLeaders = db.TeamLeaders.Include(t => t.Project).Include(t => t.ProjectManager);
            return View(teamLeaders.ToList());
        }

        // Displays the details of the current Team Leader
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TeamLeader teamLeader = db.TeamLeaders.Find(id);
            if (teamLeader == null)
            {
                return HttpNotFound();
            }
            return View(teamLeader);
        }

        // Displays all the members of the team, the current Team Leader is part of
        public ActionResult Team(int? id, TeamLeader teamLeader)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            teamLeader = db.TeamLeaders.Find(id);

            if (teamLeader == null)
            {
                return HttpNotFound();
            }

            var query1 = (from row in db.TeamLeaders
                          where row.Project.ProjectName == teamLeader.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query2 = (from row in db.Seniors
                          where row.Project.ProjectName == teamLeader.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query3 = (from row in db.Intermediates
                          where row.Project.ProjectName == teamLeader.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query4 = (from row in db.Juniors
                          where row.Project.ProjectName == teamLeader.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query5 = (from row in db.Trainees
                          where row.Project.ProjectName == teamLeader.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query = query1.Concat(query2).Concat(query3).Concat(query4).Concat(query5);

            var team = new List<TeamLeader>();

            foreach (var item in query)
            {
                team.Add(new TeamLeader()
                {
                    Name = item.Name,
                    Position = item.Position,
                    Project = item.Project
                });
            }

            return View(team);
        }

        // Creates new Team Leader
        public ActionResult Create()
        {
            TeamLeader positionName = new TeamLeader()
            {
                Position = "Team Leader"
            };

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName");
            ViewBag.ManagerID = new SelectList(db.ProjectManagers, "ID", "Name");
            return View(positionName);
        }

        // Posts the information for the new Team Leader
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] TeamLeader teamLeader)
        {
            if (ModelState.IsValid)
            {
                db.TeamLeaders.Add(teamLeader);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", teamLeader.ProjectID);
            ViewBag.ManagerID = new SelectList(db.ProjectManagers, "ID", "Name", teamLeader.ManagerID);
            return View(teamLeader);
        }

        // Edits the details of the Team Leader
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TeamLeader teamLeader = db.TeamLeaders.Find(id);
            if (teamLeader == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", teamLeader.ProjectID);
            ViewBag.ManagerID = new SelectList(db.ProjectManagers, "ID", "Name", teamLeader.ManagerID);
            return View(teamLeader);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] TeamLeader teamLeader)
        {
            if (ModelState.IsValid)
            {
                db.Entry(teamLeader).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", teamLeader.ProjectID);
            ViewBag.ManagerID = new SelectList(db.ProjectManagers, "ID", "Name", teamLeader.ManagerID);
            return View(teamLeader);
        }

        // Releases all resources that are used by the current instance of the class
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
