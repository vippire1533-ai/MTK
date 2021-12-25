using WebTraiCay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopCayCanh.Controllers
{
    public class TrackOrderController : Controller
    {
        WebTraiCayDbContext db = new WebTraiCayDbContext();
        // GET: TrackOrder
        public ActionResult ListOrderOfUser()
        {
            var id = int.Parse(Session["id"].ToString());
            var listOrder = db.Orders.Where(m => m.userid == id).OrderByDescending(m => m.ID).ToList();
            return View("listOrders", listOrder);
        }
        public ActionResult DetailOrder(int id)
        {
            var listOrder = db.Orders.Find(id);
            return View("DetailOrder", listOrder);
        }
        public ActionResult productDetailCheckOut(int orderId)
        {
            var list = db.Orderdetails.Where(m => m.orderid == orderId).ToList();
            return View("_productDetailCheckOut", list);

        }
        public ActionResult subnameProduct(int id)
        {
            var list = db.Products.Find(id);
            return View("_subproductOrdersuccess", list);

        }
    }
}