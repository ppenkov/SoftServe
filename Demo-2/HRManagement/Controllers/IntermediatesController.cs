using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HRManagement.Models;

namespace HRManagement.Controllers
{
    public class IntermediatesController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the Intermediates
        public ActionResult Index()
        {
            var intermediates = db.Intermediates.Include(i => i.Project).Include(i => i.TeamLeader);
            return View(intermediates.ToList());
        }

        // Displays the details of the current Intermediates
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Intermediate intermediate = db.Intermediates.Find(id);
            if (intermediate == null)
            {
                return HttpNotFound();
            }
            return View(intermediate);
        }

        // Displays all the members of the team, the current Intermediate is part of
        public ActionResult Team(int? id, Intermediate intermediate)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            intermediate = db.Intermediates.Find(id);

            if (intermediate == null)
            {
                return HttpNotFound();
            }

            var query1 = (from row in db.TeamLeaders
                          where row.Project.ProjectName == intermediate.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query2 = (from row in db.Seniors
                          where row.Project.ProjectName == intermediate.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query3 = (from row in db.Intermediates
                          where row.Project.ProjectName == intermediate.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query4 = (from row in db.Juniors
                          where row.Project.ProjectName == intermediate.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query5 = (from row in db.Trainees
                          where row.Project.ProjectName == intermediate.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query = query1.Concat(query2).Concat(query3).Concat(query4).Concat(query5);

            var team = new List<Intermediate>();

            foreach (var item in query)
            {
                team.Add(new Intermediate()
                {
                    Name = item.Name,
                    Position = item.Position,
                    Project = item.Project
                });
            }

            return View(team);
        }


        // Creates new Intermediate
        public ActionResult Create()
        {
            Intermediate positionName = new Intermediate()
            {
                Position = "Intermediate"
            };

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName");
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name");
            return View(positionName);
        }

        // Posts the information for the new Intermediate
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Intermediate intermediate)
        {
            if (ModelState.IsValid)
            {
                db.Intermediates.Add(intermediate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", intermediate.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", intermediate.ManagerID);
            return View(intermediate);
        }

        // Edits the details of the Intermediate
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Intermediate intermediate = db.Intermediates.Find(id);
            if (intermediate == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", intermediate.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", intermediate.ManagerID);
            return View(intermediate);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Intermediate intermediate)
        {
            if (ModelState.IsValid)
            {
                db.Entry(intermediate).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", intermediate.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", intermediate.ManagerID);
            return View(intermediate);
        }

        // Deletes the information of current Intermediate
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Intermediate intermediate = db.Intermediates.Find(id);
            if (intermediate == null)
            {
                return HttpNotFound();
            }
            return View(intermediate);
        }

        // Performs the delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Intermediate intermediate = db.Intermediates.Find(id);
            db.Intermediates.Remove(intermediate);
            db.SaveChanges();
            return RedirectToAction("Index");
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
