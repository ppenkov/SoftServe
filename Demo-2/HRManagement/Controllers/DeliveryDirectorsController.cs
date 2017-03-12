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
    public class DeliveryDirectorsController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // Displays the Delivery Directors
        public ActionResult Index()
        {
            var deliveryDirectors = db.DeliveryDirectors.Include(d => d.CEO);
            return View(deliveryDirectors.ToList());
        }

        // Displays the details of the current Delivery Directors
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeliveryDirector deliveryDirector = db.DeliveryDirectors.Find(id);
            if (deliveryDirector == null)
            {
                return HttpNotFound();
            }
            return View(deliveryDirector);
        }

        // Creates new Delivery Director
        public ActionResult Create()
        {
            DeliveryDirector positionName = new DeliveryDirector()
            {
                Position = "Delivery Director"
            };

            ViewBag.ManagerID = new SelectList(db.CEOs, "ID", "Name");
            return View(positionName);
        }

        // Posts the information for the new Delivery Director
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ManagerID")] DeliveryDirector deliveryDirector)
        {
            if (ModelState.IsValid)
            {
                db.DeliveryDirectors.Add(deliveryDirector);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerID = new SelectList(db.CEOs, "ID", "Name", deliveryDirector.ManagerID);
            return View(deliveryDirector);
        }

        // Edits the details of the Delivery Director
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeliveryDirector deliveryDirector = db.DeliveryDirectors.Find(id);
            if (deliveryDirector == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerID = new SelectList(db.CEOs, "ID", "Name", deliveryDirector.ManagerID);
            return View(deliveryDirector);
        }

        // Posts the changes which are made 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ManagerID")] DeliveryDirector deliveryDirector)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deliveryDirector).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerID = new SelectList(db.CEOs, "ID", "Name", deliveryDirector.ManagerID);
            return View(deliveryDirector);
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
