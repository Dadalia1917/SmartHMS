using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hospital.Models;

namespace Hospital.Controllers
{
    public class DCController : Controller
    {
        HospitalDBEntities db = new HospitalDBEntities();
        // GET: Doctor
        //医生
        public ActionResult Doctor()
        {
            //科室下拉框
            ViewBag.k = db.Bumen.ToList();
            var d = db.Doctor.ToList();
            return View(d);
        }
        /// <summary>
        /// 医生查询方法
        /// </summary>
        /// <param name="Ysname"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Doctor(string Ysname)
        {
            //科室下拉框
            ViewBag.k = db.Bumen.ToList();
            if (Ysname == null)
            {
                return RedirectToRoute(db.Doctor.ToList());
            }
            else
            {
                return View(db.Doctor.Where(n => n.Yname.Contains(Ysname)).ToList());
            }
        }
        //添加医生Ysname
        public ActionResult AddYs()
        {
            NameValueCollection nvc = System.Web.HttpContext.Current.Request.Form;//传过来的参数
            HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;//传过来的图片
            string imgPath = "";
            if (hfc.Count>0)
            {
                imgPath = "/images/Doctor/" + hfc[0].FileName;
                string PhysicalPath = Server.MapPath(imgPath);
                hfc[0].SaveAs(PhysicalPath);

            }
            Doctor d = new Doctor();
            d.Yname = nvc.Get("Yname");
            d.Yphone = nvc.Get("Yphone");
            d.Yzhuzhi = nvc.Get("Yzhuzhi");
            d.Yjianjie = nvc.Get("Yjianjie");
            d.Yzhicheng = nvc.Get("Yzhicheng");
            d.Ysex = nvc.Get("Ysex");
            d.Ystate = nvc.Get("Ystate");
            d.Bid = int.Parse(nvc.Get("Bid"));
            d.Yold = nvc.Get("Yold");
            d.Yphoto = hfc[0].FileName;
            db.Doctor.Add(d);
            if (db.SaveChanges() > 0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }

        }
        //修改医生信息
        public ActionResult XiuYs()
        {
            NameValueCollection nvc = System.Web.HttpContext.Current.Request.Form;//传过来的参数
            HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;//传过来的图片
            string imgPath = "";
            //
            if (hfc.Count > 0 && hfc[0].FileName != "")
            {
                imgPath = "/images/Doctor/" + hfc[0].FileName;
                string PhysicalPath = Server.MapPath(imgPath);
                hfc[0].SaveAs(PhysicalPath);

            }
            var d = db.Doctor.Find(int.Parse(nvc.Get("YsID")));
            d.Yname = nvc.Get("Yname");
            d.Yphone = nvc.Get("Yphone");
            d.Yzhuzhi = nvc.Get("Yzhuzhi");
            d.Yjianjie = nvc.Get("Yjianjie");
            d.Yzhicheng = nvc.Get("Yzhicheng");
            d.Ysex = nvc.Get("Ysex");
            d.Ystate = nvc.Get("Ystate");
            d.Bid = int.Parse(nvc.Get("Bid"));
            d.Yold = nvc.Get("Yold");
            if (hfc[0].FileName!="")
            {
                d.Yphoto = hfc[0].FileName;
            }
            if (db.SaveChanges() > 0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        //科室部门
        public ActionResult Bumen()
        {
            var k = db.Bumen.ToList();
            return View(k);
        }
        [HttpPost]
        //科室查询方法
        public ActionResult Bumen(string Bname)
        {
            if (Bname == null)
            {
                return RedirectToRoute(db.Bumen.ToList());
            }
            else
            {
                return View(db.Bumen.Where(n => n.Bname.Contains(Bname)).ToList());
            }
        }
        //科室添加方法
        [HttpPost]
        public ActionResult Bumens(Bumen b)
        {
            db.Bumen.Add(b);
            if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        //科室删除方法
        public ActionResult BRemove(int id)
        {
           
            db.Bumen.Remove(db.Bumen.FirstOrDefault(n=>n.Bid==id));
             if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        //科室修改方法
        public ActionResult Xiu(string Bid,string Bname,string Bmiaoshu)
        {
            var b = db.Bumen.Find(int.Parse(Bid));
            b.Bname = Bname;
            b.Bmiaoshu = Bmiaoshu;
            if (db.SaveChanges() > 0)
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