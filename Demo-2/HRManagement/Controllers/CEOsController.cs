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
    public class CEOsController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the CEO
        public ActionResult Index()
        {
            return View(db.CEOs.ToList());
        }

        // Displays the details of the CEO
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CEO cEO = db.CEOs.Find(id);
            if (cEO == null)
            {
                return HttpNotFound();
            }
            return View(cEO);
        }

        // Edits the details of the CEO
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CEO cEO = db.CEOs.Find(id);
            if (cEO == null)
            {
                return HttpNotFound();
            }
            return View(cEO);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone")] CEO cEO)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cEO).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cEO);
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
