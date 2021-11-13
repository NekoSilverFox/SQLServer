using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PersonManager
    {

        /// <summary>
        /// 创建一个全局的数据层访问对象，因为以后的很多操作都需要调用数据访问层中的方法
        /// </summary>
        DAL.PersonService personService = new DAL.PersonService();

        # region 实现登录 +MODEL.Person Login(string name)
        /// <summary>
        /// 实现登录
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public MODEL.Person Login(string name)
        {
            return personService.Login(name);
        }
        #endregion


        #region
        /// <summary>
        /// 获取所有人员列表
        /// </summary>
        /// <param name="isDel"></param>
        /// <returns></returns>
        public List<MODEL.Person> GetAllPersonList(bool isDel)
        {
            return personService.GetAllPersonList(isDel);
        }
        #endregion
    }
}
