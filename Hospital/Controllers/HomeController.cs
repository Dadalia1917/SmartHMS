using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Hospital.Models;
using Hospital.Services;

namespace Hospital.Controllers
{
    public class HomeController : BaseController
    {
        private readonly HospitalService hospitalService;

        public HomeController()
        {
            hospitalService = new HospitalService(db);
        }

        // GET: Home
        public ActionResult Index()
        {
            // 使用服务类获取统计数据
            var doctorStats = hospitalService.GetDoctorStatistics();
            ViewBag.zaizhi = doctorStats.active;
            ViewBag.lizhi = doctorStats.resigned;
            ViewBag.xiujia = doctorStats.vacation;
            
            ViewBag.zhuyuan = hospitalService.GetAdmittedPatientsCount();
            ViewBag.meng = hospitalService.GetTotalRegistrationCount();
            ViewBag.h = hospitalService.GetTodayRegistrations().ToList();
            ViewBag.k = db.Bumen.Count();
            ViewBag.z = hospitalService.GetCurrentMonthRegistrationCount();
            
            var doctors = db.Doctor.ToList();
            return View(doctors);
        }
        //登录的方法
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login login)
        {
            var user = db.Login.FirstOrDefault(n => n.Account == login.Account 
                                                 && n.Password == login.Password 
                                                 && n.Doctor.Ystate != SystemConstants.DOCTOR_STATUS_RESIGNED);
            if (user != null)
            {
                Session[SystemConstants.SESSION_USER_NAME] = user.Doctor.Yname;
                Session[SystemConstants.SESSION_USER_POSITION] = user.Zhiwu;
                Session[SystemConstants.SESSION_USER_ID] = user.YsID;
                return Redirect("/Home/Index");
            }
            else
            {
                return ErrorMessage(SystemConstants.ERROR_LOGIN_FAILED, "/Home/Login");
            }
        }
        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public ActionResult LogOut()
        {
            Session.Remove(SystemConstants.SESSION_USER_NAME);
            Session.Remove(SystemConstants.SESSION_USER_POSITION);
            Session.Remove(SystemConstants.SESSION_USER_ID);
            return RedirectToAction("Login");
        }
        /// <summary>
        /// 用户管理模块
        /// </summary>
        /// <returns></returns>
        public ActionResult Yhu()
        {
            var p = db.Login.ToList();
            ViewBag.li = db.Doctor.ToList();
            return View(p);
        }
        [HttpPost]
        public ActionResult Yhu(Login l)
        {
            var users = db.Login.ToList();
            ViewBag.li = db.Doctor.ToList();         
            db.Login.Add(l);           
            var result = db.SaveChanges();
            if (result > 0)
            {
                return RedirectToRoute(users);
            }
            else
            {
                return ErrorMessage(SystemConstants.ERROR_ADD_FAILED, "/Home/Yhu");
            }
        }
        /// <summary>
        /// 用户删除方法
        /// </summary>
        /// <param name="ac"></param>
        /// <returns></returns>
        public ActionResult Del(int ac)
        {
            var user = db.Login.Find(ac);
            if (user != null)
            {
                db.Login.Remove(user);
                return SaveResult(db.SaveChanges());
            }
            return Content(SystemConstants.FAILURE_RESPONSE);
        }
        /// <summary>
        /// 修改方法
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="Account"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public ActionResult Xiu(int ID, string Account, string Password)
        {
            var user = db.Login.Find(ID);
            if (user != null)
            {
                user.Account = Account;
                user.Password = Password;
                return SaveResult(db.SaveChanges());
            }
            return Content(SystemConstants.FAILURE_RESPONSE);
        }

    }
}