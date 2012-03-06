using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AmoreApp.Website.Models;

namespace AmoreApp.Website.Controllers
{
    public class HomeController : Controller
    {
        ServiceModel _serviceModel;
        public HomeController()
        {
            _serviceModel = new ServiceModel();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {            
            return View();
        }

        public ActionResult Register()
        {
            ViewData["ResponseString"] = _serviceModel.GetTestString();
            return View();
        }
        
    }
}
