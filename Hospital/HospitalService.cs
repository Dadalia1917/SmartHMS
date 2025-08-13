using System;
using System.Collections.Generic;
using System.Linq;
using Hospital.Models;
using Hospital.Controllers;

namespace Hospital.Services
{
    /// <summary>
    /// 医院业务逻辑服务类
    /// </summary>
    public class HospitalService
    {
        private readonly HospitalDBEntities db;

        public HospitalService(HospitalDBEntities dbContext)
        {
            db = dbContext;
        }

        #region 医生相关查询
        /// <summary>
        /// 获取在职医生列表
        /// </summary>
        public IQueryable<Doctor> GetActiveDoctors()
        {
            return db.Doctor.Where(n => n.Ystate == SystemConstants.DOCTOR_STATUS_ACTIVE);
        }

        /// <summary>
        /// 获取医生统计信息
        /// </summary>
        public (int active, int resigned, int vacation) GetDoctorStatistics()
        {
            var active = db.Doctor.Count(n => n.Ystate == SystemConstants.DOCTOR_STATUS_ACTIVE);
            var resigned = db.Doctor.Count(n => n.Ystate == SystemConstants.DOCTOR_STATUS_RESIGNED);
            var vacation = db.Doctor.Count(n => n.Ystate == SystemConstants.DOCTOR_STATUS_VACATION);
            
            return (active, resigned, vacation);
        }
        #endregion

        #region 药品相关查询
        /// <summary>
        /// 获取未过期药品
        /// </summary>
        public IQueryable<Medicine> GetValidMedicines()
        {
            return db.Medicine.Where(n => n.Mguoqi > DateTime.Now);
        }

        /// <summary>
        /// 获取过期药品
        /// </summary>
        public IQueryable<Medicine> GetExpiredMedicines()
        {
            return db.Medicine.Where(n => n.Mguoqi < DateTime.Now);
        }
        #endregion

        #region 住院相关查询
        /// <summary>
        /// 获取未入院患者
        /// </summary>
        public IQueryable<Zhuyuan> GetNotAdmittedPatients()
        {
            return db.Zhuyuan.Where(n => n.state == SystemConstants.ZHUYUAN_STATUS_NOT_ADMITTED);
        }

        /// <summary>
        /// 获取已入院患者
        /// </summary>
        public IQueryable<Zhuyuan> GetAdmittedPatients()
        {
            return db.Zhuyuan.Where(n => n.state == SystemConstants.ZHUYUAN_STATUS_ADMITTED);
        }

        /// <summary>
        /// 获取住院统计
        /// </summary>
        public int GetAdmittedPatientsCount()
        {
            return db.Zhuyuan.Count(n => n.state == SystemConstants.ZHUYUAN_STATUS_ADMITTED);
        }
        #endregion

        #region 挂号相关查询
        /// <summary>
        /// 获取本月挂号数量
        /// </summary>
        public int GetCurrentMonthRegistrationCount()
        {
            return db.Guahao.Count(n => n.Gtime.Month == DateTime.Now.Month);
        }

        /// <summary>
        /// 获取今日挂号列表
        /// </summary>
        public IQueryable<Guahao> GetTodayRegistrations()
        {
            return db.Guahao.Where(n => n.Gstate == SystemConstants.GUAHAO_STATUS_TODAY);
        }

        /// <summary>
        /// 获取总挂号数量
        /// </summary>
        public int GetTotalRegistrationCount()
        {
            return db.Guahao.Count();
        }
        #endregion

        #region 缴费相关查询
        /// <summary>
        /// 获取未支付订单
        /// </summary>
        public IQueryable<Morder> GetUnpaidOrders()
        {
            return db.Morder.Where(n => n.zhifu == SystemConstants.PAYMENT_STATUS_UNPAID);
        }

        /// <summary>
        /// 获取已支付订单
        /// </summary>
        public IQueryable<Morder> GetPaidOrders()
        {
            return db.Morder.Where(n => n.zhifu == SystemConstants.PAYMENT_STATUS_PAID);
        }
        #endregion

        #region 排班相关查询
        /// <summary>
        /// 获取有效排班信息
        /// </summary>
        public IQueryable<Paiban> GetActiveSchedules()
        {
            return db.Paiban.Where(n => n.Doctor.Ystate == SystemConstants.DOCTOR_STATUS_ACTIVE 
                                      && n.Pstate == SystemConstants.PAIBAN_STATUS_ACTIVE);
        }
        #endregion
    }
}
