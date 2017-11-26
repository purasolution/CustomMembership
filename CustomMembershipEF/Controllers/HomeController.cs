using CustomMembershipEF.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CustomMembershipEF.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        [Authorize]
        public ActionResult Admin()
        {
            var user = (UserIdentity)User.Identity;
            return View((object)user.UserId);
        }

        [Authorize(Roles = "SuperAdmin")]
        public ActionResult SuperAdmin()
        {
            return View();
        }
    }
}
