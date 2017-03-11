﻿using System;
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
    public class SeniorsController : Controller
    {
        private EmployeeDB db = new EmployeeDB();

        // GET: Seniors
        public ActionResult Index()
        {
            var seniors = db.Seniors.Include(s => s.Project).Include(s => s.TeamLeader);
            return View(seniors.ToList());
        }

        // GET: Seniors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Senior senior = db.Seniors.Find(id);
            if (senior == null)
            {
                return HttpNotFound();
            }
            return View(senior);
        }

        public ActionResult Team()
        {
            var senior = db.Seniors.Where(p => p.Project.ProjectName == "Euro 2020");
                               //.Concat(db.Juniors.Where(p => p.Juniors.ProjectName == "Euro 2020"))
                               //.Concat(db.Trainees.Where(p => p.Project.ProjectName == "Euro 2020"));
            return View(senior.ToList());

        }

        // GET: Seniors/Create
        public ActionResult Create()
        {
            Senior positionName = new Senior()
            {
                Position = "Senior"
            };

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName");
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name");
            return View(positionName);
        }

        // POST: Seniors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Senior senior)
        {
            if (ModelState.IsValid)
            {
                db.Seniors.Add(senior);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", senior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", senior.ManagerID);
            return View(senior);
        }

        // GET: Seniors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Senior senior = db.Seniors.Find(id);
            if (senior == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", senior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", senior.ManagerID);
            return View(senior);
        }

        // POST: Seniors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Position,Salary,City,Email,Phone,ProjectID,ManagerID")] Senior senior)
        {
            if (ModelState.IsValid)
            {
                db.Entry(senior).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectID = new SelectList(db.Projects, "ID", "ProjectName", senior.ProjectID);
            ViewBag.ManagerID = new SelectList(db.TeamLeaders, "ID", "Name", senior.ManagerID);
            return View(senior);
        }

        // GET: Seniors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Senior senior = db.Seniors.Find(id);
            if (senior == null)
            {
                return HttpNotFound();
            }
            return View(senior);
        }

        // POST: Seniors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Senior senior = db.Seniors.Find(id);
            db.Seniors.Remove(senior);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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