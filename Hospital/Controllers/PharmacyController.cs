using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hospital.Models;

namespace Hospital.Controllers
{
    public class PharmacyController : Controller
    {
        HospitalDBEntities db = new HospitalDBEntities();
        // GET: Pharmacy
        public ActionResult Medicine()
        {
            var p = db.Medicine.Where(n=>n.Mguoqi>DateTime.Now);
            ViewBag.p = db.Medicine.Where(n => n.Mguoqi < DateTime.Now);
            return View(p);
        }
        /// <summary>
        /// 药品查询方法
        /// </summary>
        /// <param name="Mname"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Medicine(string Mname)
        {
            var p = db.Medicine.Where(n => n.Mname.Contains(Mname)&& n.Mguoqi > DateTime.Now).ToList();
            ViewBag.p = db.Medicine.Where(n => n.Mguoqi < DateTime.Now);
            return View(p);
        }
        /// <summary>
        /// 添加药品方法
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public ActionResult Addm(Medicine m)
        {
            db.Medicine.Add(m);
            if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        /// <summary>
        /// 修改药品信息方法
        /// </summary>
        /// <param name="medicineID"></param>
        /// <param name="Mname"></param>
        /// <param name="Mdizhi"></param>
        /// <param name="Mshu"></param>
        /// <param name="Mdanwei"></param>
        /// <param name="Mliaoxiao"></param>
        /// <param name="Mmoneyj"></param>
        /// <param name="Mmoneyc"></param>
        /// <param name="Mshengchan"></param>
        /// <param name="Mguoqi"></param>
        /// <returns></returns>
        public ActionResult Xiu(int medicineID,string Mname,string Mdizhi,int Mshu,string Mdanwei,string Mliaoxiao,decimal Mmoneyj,decimal Mmoneyc,DateTime Mshengchan,DateTime Mguoqi)
        {
            var m = db.Medicine.Find(medicineID);
            m.Mname = Mname;
            m.Mdizhi = Mdizhi;
            m.Mshu = Mshu;
            m.Mdanwei = Mdanwei;
            m.Mliaoxiao = Mliaoxiao;
            m.Mmoneyj = Mmoneyj;
            m.Mmoneyc = Mmoneyc;
            m.Mshengchan = Mshengchan;
            m.Mguoqi = Mguoqi;
            if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
            
        }
        /// <summary>
        /// 项目中心
        /// </summary>
        /// <returns></returns>
        public ActionResult Xiang()
        {
            var p = db.Xiangmu.ToList();
            return View(p);
        }
        /// <summary>
        /// 项目添加方法
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Xiang(Xiangmu x)
        {
            db.Xiangmu.Add(x);
            var p = db.Xiangmu.ToList();
            if (db.SaveChanges()>0)
            {
                return RedirectToRoute(p);
            }
            return View(p);
        }
        [HttpPost]
        public ActionResult Cha(string Xname)
        {
            var p = db.Xiangmu.Where(n => n.Xname.Contains(Xname)).ToList();
            if (p!=null)
            {
                return RedirectToRoute(p);
            }
            else
            {
                return RedirectToRoute(db.Xiangmu.ToList());
            }
            
        }
        /// <summary>
        /// 修改项目方法
        /// </summary>
        /// <param name="Xid"></param>
        /// <param name="Xname"></param>
        /// <param name="Xchenben"></param>
        /// <param name="Xmoney"></param>
        /// <param name="Xstate"></param>
        /// <returns></returns>
        public ActionResult XiangXiu(int  Xid,string Xname,decimal Xchenben,decimal Xmoney,string Xstate)
        {
            var p = db.Xiangmu.Find(Xid);
            p.Xname = Xname;
            p.Xchenben = Xchenben;
            p.Xmoney = Xmoney;
            p.Xstate = Xstate;
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