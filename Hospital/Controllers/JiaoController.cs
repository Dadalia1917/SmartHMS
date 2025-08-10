using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hospital.Models;

namespace Hospital.Controllers
{
    public class JiaoController : Controller
    {
        HospitalDBEntities db = new HospitalDBEntities();
        // GET: Jiao 列表
        public ActionResult Jiao()
        {
            var sum = db.Morder.Where(n=>n.zhifu=="未支付").ToList();
            ViewBag.h= db.Morder.Where(n => n.zhifu == "已支付").ToList();
            return View(sum);
        }
        [HttpPost]
        public ActionResult Jiao(string shen)
        {
            var sum = db.Morder.Where(n => n.zhifu == "未支付"&&n.Guahao.Gshenfenzheng==shen).ToList();
            ViewBag.h = db.Morder.Where(n => n.zhifu == "已支付").ToList();
            return View(sum);
        }
        public ActionResult Xiu(string zhifu,int OrderIDm)
        {
            var p = db.Morder.Find(OrderIDm);
            p.zhifu = zhifu;
            if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
    }
}