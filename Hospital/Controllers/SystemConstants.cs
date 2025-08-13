namespace Hospital.Controllers
{
    /// <summary>
    /// 系统常量定义
    /// </summary>
    public static class SystemConstants
    {
        #region 操作结果常量
        public const string SUCCESS_RESPONSE = "yes";
        public const string FAILURE_RESPONSE = "no";
        #endregion

        #region 医生状态常量
        public const string DOCTOR_STATUS_ACTIVE = "在职";
        public const string DOCTOR_STATUS_RESIGNED = "已离职";
        public const string DOCTOR_STATUS_VACATION = "休假";
        #endregion

        #region 挂号状态常量
        public const string GUAHAO_STATUS_TODAY = "0";
        public const string GUAHAO_STATUS_COMPLETED = "1";
        #endregion

        #region 住院状态常量
        public const string ZHUYUAN_STATUS_NOT_ADMITTED = "未入院";
        public const string ZHUYUAN_STATUS_ADMITTED = "已入院";
        public const string ZHUYUAN_STATUS_DISCHARGED = "已出院";
        #endregion

        #region 支付状态常量
        public const string PAYMENT_STATUS_UNPAID = "未支付";
        public const string PAYMENT_STATUS_PAID = "已支付";
        #endregion

        #region 排班状态常量
        public const string PAIBAN_STATUS_ACTIVE = "1";
        public const string PAIBAN_STATUS_INACTIVE = "0";
        #endregion

        #region Session键常量
        public const string SESSION_USER_NAME = "name";
        public const string SESSION_USER_POSITION = "zhiwu";
        public const string SESSION_USER_ID = "Yid";
        #endregion

        #region 错误消息常量
        public const string ERROR_LOGIN_FAILED = "登录失败！账号或密码错误！";
        public const string ERROR_ADD_FAILED = "添加失败请重试！";
        public const string ERROR_OPERATION_FAILED = "操作失败，请重试！";
        #endregion
    }
}
