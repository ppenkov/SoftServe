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
    public class ProjectManagersController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the Project Managers
        public ActionResult Index()
        {
            var projectManagers = db.ProjectManagers.Include(p => p.DeliveryDirector);
            return View(projectManagers.ToList());
        }

        // Displays the details of the current Project Manager
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectManager projectManager = db.ProjectManagers.Find(id);
            if (projectManager == null)
            {
                return HttpNotFound();
            }
            return View(projectManager);
        }

        // Creates new ProjectManager
        public ActionResult Create()
        {
            ProjectManager positionName = new ProjectManager()
            {
                Position = "Project Manager"
            };

            ViewBag.ManagerID = new SelectList(db.DeliveryDirectors, "ID", "Name");
            return View(positionName);
        }

        // Posts the information for the new Project Manager
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ManagerID")] ProjectManager projectManager)
        {
            if (ModelState.IsValid)
            {
                db.ProjectManagers.Add(projectManager);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerID = new SelectList(db.DeliveryDirectors, "ID", "Name", projectManager.ManagerID);
            return View(projectManager);
        }

        // Edits the details of the Project Manager
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectManager projectManager = db.ProjectManagers.Find(id);
            if (projectManager == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerID = new SelectList(db.DeliveryDirectors, "ID", "Name", projectManager.ManagerID);
            return View(projectManager);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ManagerID")] ProjectManager projectManager)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectManager).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerID = new SelectList(db.DeliveryDirectors, "ID", "Name", projectManager.ManagerID);
            return View(projectManager);
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
