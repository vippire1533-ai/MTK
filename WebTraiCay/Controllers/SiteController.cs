﻿using WebTraiCay.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebTraiCay.Controllers
{
    public class SiteController : Controller
    {
        WebTraiCayDbContext db = new WebTraiCayDbContext();
        // GET: Site
        public ActionResult Index(String slug = "")
        {
            int page = 1;
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page = int.Parse(Request.QueryString["page"].ToString());
            }

            if (slug == "")
            {
                return this.home();
            }
            else
            {
                var rowlink = db.Link.Where(m => m.slug == slug);
                if (rowlink.Count() > 0)
                {
                    var link = rowlink.First();
                    if (link.type == "ProductDetail" && link.tableId == 1)
                    {
                        return this.ProductDetail(slug);
                    }
                    else if (link.type == "category" && link.tableId == 2)
                    {

                        return this.productOfCategory(slug);
                    }
                    else if (link.type == "topic" && link.tableId == 3)
                    {
                        return this.topic_category(slug);
                    }
                    else if (link.type == "PostDetail" && link.tableId == 4)
                    {
                        return this.postDetaail(slug);
                    }
                }
                else
                {
                    //slug k co tring ban link
                    return this.page404();
                }
                return this.page404();
            }
          
        }
        public ActionResult home()
        {
           
            var list = db.Categorys.Where(m => m.status == 1).
                 Where(m => m.parentid == 0)
                 .OrderBy(m => m.orders);
            return View("Index", list);
        }


        public ActionResult topic_category(String slug)
        {
            var catid = db.topics.Where(m => m.status == 1 && m.slug == slug).First();
            return View("post_category", catid);
        }
        private ActionResult ProductDetail(String slug)
        {
            var list = db.Products.Where(m => m.status == 1 && m.slug == slug).First();
            return View("ProductDetail", list);
        }
        public ActionResult productOfCategory(String slug)
        { 
            var catid = db.Categorys.Where(m => m.slug == slug).First();
            return View("category", catid);
        }
        public ActionResult postDetaail(String slug)
        {
            var detail = db.posts.Where(m => m.status == 1 && m.slug == slug).First();
            return View("post_detail", detail);
        }
        public ActionResult page404()
        {
            return View("");
        }
    }
}