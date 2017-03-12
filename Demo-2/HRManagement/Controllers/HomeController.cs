using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRManagement.Controllers
{
    public class HomeController : Controller
    {
        // Displays the Index page
        public ActionResult Index()
        {
            return View();
        }

        // Displays the Manager page
        public ActionResult Management()
        {

            return View();
        }

        // Displays the Developer page
        public ActionResult Developers()
        {

            return View();
        }
    }
}