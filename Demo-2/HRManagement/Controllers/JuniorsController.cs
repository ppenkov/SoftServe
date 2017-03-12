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
    public class JuniorsController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the Juniors
        public ActionResult Index()
        {
            var juniors = db.Juniors.Include(j => j.Project).Include(j => j.TeamLeader);
            return View(juniors.ToList());
        }

        // Displays the details of the current Junior
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Junior junior = db.Juniors.Find(id);
            if (junior == null)
            {
                return HttpNotFound();
            }
            return View(junior);
        }

        // Displays all the members of the team, the current Junior is part of
        public ActionResult Team(int? id, Junior junior)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            junior = db.Juniors.Find(id);

            if (junior == null)
            {
                return HttpNotFound();
            }

            var query1 = (from row in db.TeamLeaders
                          where row.Project.ProjectName == junior.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query2 = (from row in db.Seniors
                          where row.Project.ProjectName == junior.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query3 = (from row in db.Intermediates
                          where row.Project.ProjectName == junior.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query4 = (from row in db.Juniors
                          where row.Project.ProjectName == junior.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query5 = (from row in db.Trainees
                          where row.Project.ProjectName == junior.Project.ProjectName
                          select new { row.Name, row.Position, row.Project, row.Project.ProjectManager });

            var query = query1.Concat(query2).Concat(query3).Concat(query4).Concat(query5);

            var team = new List<Junior>();

            foreach (var item in query)
            {
                team.Add(new Junior()
                {
                    Name = item.Name,
                    Position = item.Position,
                    Project = item.Project
                });
            }

            return View(team);
        }


        // Creates new Junior
        public ActionResult Create()
        {
            Junior positionName = new Junior()
            {
                Position = "Junior"
            };

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName");
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name");
            return View(positionName);
        }

        // Posts the information for the new Junior
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Junior junior)
        {
            if (ModelState.IsValid)
            {
                db.Juniors.Add(junior);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", junior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", junior.ManagerID);
            return View(junior);
        }

        // Edits the details of the Junior
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Junior junior = db.Juniors.Find(id);
            if (junior == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", junior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", junior.ManagerID);
            return View(junior);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Junior junior)
        {
            if (ModelState.IsValid)
            {
                db.Entry(junior).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", junior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", junior.ManagerID);
            return View(junior);
        }

        // Deletes the information of current Junior
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Junior junior = db.Juniors.Find(id);
            if (junior == null)
            {
                return HttpNotFound();
            }
            return View(junior);
        }

        // Performs the delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Junior junior = db.Juniors.Find(id);
            db.Juniors.Remove(junior);
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
