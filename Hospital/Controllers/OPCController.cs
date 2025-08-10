using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hospital.Models;

namespace Hospital.Controllers
{

    public class OPCController : Controller
    {
        HospitalDBEntities db = new HospitalDBEntities();

        // GET: OPC
        public ActionResult GuaHao()
        {

            var g = db.Paiban.Where(n => n.Doctor.Ystate == "在职" && n.Pstate == "1" && n.Ptimej.Hours > DateTime.Now.Hour);//0表示该挂号已删除（已弃用）
            return View(g);
        }
        /// <summary>
        /// 用户挂号
        /// </summary>
        /// <param name="Gname"></param>
        /// <param name="GPhone"></param>
        /// <param name="Gshenfenzheng"></param>
        /// <param name="GSex"></param>
        /// <param name="Gstate"></param>
        /// <param name="Pid"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GuaHao(string Gname, string GPhone, string Gshenfenzheng, string GSex, string Gstate, int Pid)
        {
            ViewBag.val = db.Paiban.ToList();
            Guahao g = new Guahao();
            g.Gname = Gname;
            g.GPhone = GPhone;
            g.Gshenfenzheng = Gshenfenzheng;
            g.GSex = GSex;
            g.Gstate = Gstate;
            g.Pid = Pid;
            g.Gtime = DateTime.Now.ToLocalTime();
            db.Guahao.Add(g);
            if (db.SaveChanges() == 1)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        /// <summary>
        /// 处方划价
        /// </summary>
        /// <returns></returns>
        public ActionResult Chufang()
        {
            ViewBag.Yao = db.Medicine.Where(n => n.Mguoqi > DateTime.Now);
            var c = db.Guahao.Where(n => n.Gstate == "0").ToList();//显示未问诊的信息
            return View(c);
        }
        /// <summary>
        /// 处方划价-提交病情
        /// </summary>
        /// <returns></returns>
        public ActionResult Bing(string Bingli, int Gid)
        {
            var b = db.Guahao.Find(Gid);
            b.Gbingli = Bingli;
            if (db.SaveChanges() > 0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }

        }
        /// <summary>
        /// 转住院
        /// </summary>
        /// <returns></returns>
        public ActionResult Zhuyuan(int Gid, string ke, string state)
        {
            Zhuyuan zhu = new Zhuyuan();
            zhu.Gid = Gid;
            zhu.Ke = ke;
            zhu.state = state;
            db.Zhuyuan.Add(zhu);
            var g = db.Guahao.Find(Gid);
            g.Gstate = "1";//表示已问诊
            if (db.SaveChanges() > 0)
            {
                return Content("yes");
            }
            else
            {
                return Content("no");
            }
        }
        /// <summary>
        /// 添加药品到处方表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Buy(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;//贪婪加载
            var data = db.Medicine.SingleOrDefault(n => n.medicineID == id);
            return Json(new { code = 0, data = data });
        }
        /// <summary>
        /// 处方表提交方法
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult submit(List<test> list)
        {
            List<Morder> moList = new List<Morder>();
            foreach (var item in list)
            {
                //接收传过来的值（药品ID，购买的药品数量添加到订单表）
                Morder morder = new Morder { medicineID = item.ids, Mshu = item.num, Gid = item.gid, state = item.state, zhifu = item.zhifu, mhz = item.mhz };
                var g = db.Guahao.Find(item.gid);
                g.Gstate = "1";//表示已问诊
                //改变药品表的药品数量
                var p = db.Medicine.Find(item.ids);
                if (p != null)
                {
                    p.Mshu = p.Mshu - item.num;
                }
                moList.Add(morder);
            }
            db.Morder.AddRange(moList);
            db.SaveChanges();
            return Json(new { code = 0 });
        }
        /// <summary>
        /// 门诊患者库
        /// </summary>
        /// <returns></returns>
        public ActionResult Huanzhe()
        {
            var p = db.Guahao.ToList();
            return View(p);
        }
        [HttpPost]
        public ActionResult Huanzhe(string Gname)
        {
            var p = db.Guahao.Where(n=>n.Gname.Contains(Gname)).ToList();
            return View(p);
        }

    }
    public class test
    {
        public int ids { get; set; }
        public int num { get; set; }
        public int gid { get; set; }//挂号id
        public string state { get; set; }
        public string zhifu { get; set; }
        public string mhz { get; set; }
    }
}