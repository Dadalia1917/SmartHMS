using System;
using System.Web.Mvc;
using Hospital.Models;

namespace Hospital.Controllers
{
    /// <summary>
    /// 基础控制器，提供公共功能和数据库连接
    /// </summary>
    public class BaseController : Controller
    {
        protected HospitalDBEntities db;

        /// <summary>
        /// 构造函数，初始化数据库连接
        /// </summary>
        public BaseController()
        {
            db = new HospitalDBEntities();
        }

        /// <summary>
        /// 统一的保存操作结果处理
        /// </summary>
        /// <param name="result">保存操作结果</param>
        /// <returns>统一格式的ActionResult</returns>
        protected ActionResult SaveResult(int result)
        {
            return Content(result > 0 ? SystemConstants.SUCCESS_RESPONSE : SystemConstants.FAILURE_RESPONSE);
        }

        /// <summary>
        /// 统一的错误消息返回
        /// </summary>
        /// <param name="message">错误消息</param>
        /// <param name="redirectUrl">重定向URL</param>
        /// <returns>包含JavaScript的错误提示</returns>
        protected ActionResult ErrorMessage(string message, string redirectUrl)
        {
            return Content($"<script>alert('{message}');window.location.href='{redirectUrl}';</script>");
        }

        /// <summary>
        /// 释放数据库连接
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && db != null)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
