using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// 类库的作用是：完成某一个功能，组成一个功能模块，供他人来使用。所以他的类，无特殊要求的话都是 public
// BLL - 业务逻辑层
namespace _101___BLL___初识Business_Logic_Layer
{
    // 【重点】每一个数据库中的表都会有一个 单独的业务层处理类 和 单独的数据访问层！
    public class PersonManager
    {
        #region 登录 +bool Login(string name, string pwd)
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="name"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool Login(string name, string pwd)
        {
            _102___DAL___Data_Aceess_Layer.PersonService ps = new _102___DAL___Data_Aceess_Layer.PersonService();
            int num = (int)ps.Login(name, pwd);
            return num == 1;
        }
        #endregion
    }
}
