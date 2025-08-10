using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Google.Protobuf.WellKnownTypes;
using Hospital.Models;
using NPOI.SS.Util;

namespace Hospital.Controllers
{
    public class ChuController : Controller
    {
        HospitalDBEntities db = new HospitalDBEntities();
        // GET: Chu
        public ActionResult Paiban()
        {
            var d = db.Doctor.Where(n=>n.Ystate=="在职");
            ViewBag.chu = db.Paiban.Where(n=>n.Doctor.Ystate=="在职"&&n.Pstate=="1");//0表示该挂号已删除（已弃用）
            return View(d);
        }
        //添加出诊
        [HttpPost]
        public ActionResult Paiban(Paiban p)
        {
            var d = db.Doctor.Where(n => n.Ystate == "在职");
            ViewBag.chu = db.Paiban.Where(n => n.Doctor.Ystate == "在职" && n.Pstate == "1");
            db.Paiban.Add(p);
            if (db.SaveChanges()>0)
            {
                return View(d);
            }
            return View(d);
        }
        //修改出诊
        public ActionResult Xiu(string Pid,string Ptimek, string Ptimej,string Pmoney,string YsID,string Pstate)
        {
            var h = db.Paiban.Find(int.Parse(Pid));
            h.Ptimek = TimeSpan.Parse(Ptimek.ToString());
            h.Ptimej = TimeSpan.Parse(Ptimej.ToString());
            h.YsID =int.Parse(YsID);
            h.Pmoney =decimal.Parse( Pmoney);
            h.Pstate =Pstate;
            if (db.SaveChanges()>0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        //删除出诊信息
        public ActionResult Shan(int Pid, string Pstate)
        {
            var h = db.Paiban.Find(Pid);
            h.Pstate = Pstate;
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