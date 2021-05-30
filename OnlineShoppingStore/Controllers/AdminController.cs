using OnlineShoppingStore.Context;
using OnlineShoppingStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShoppingStore.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public UnitOfWork _unitOfWork = new UnitOfWork();
        public ActionResult Dashboard()
        {
            return View();
        }


        public ActionResult Categories()
        {
            List<Category> allcategories = _unitOfWork
                .GetRepositoryInstance<Category>()
                .GetAllRecordsIQueryable()
                .Where(i => i.IsDelete == false)
                .ToList();

            return View(allcategories);
        }
    }
}