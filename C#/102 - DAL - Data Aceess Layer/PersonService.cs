using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

// 这就是用来做数据的增加删除修改和查询的 -- ADO
// DAL -数据访问层
namespace _102___DAL___Data_Aceess_Layer
{
    public class PersonService
    {

        #region 登录 +bool Login(string name, string pwd)
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="name"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public object Login(string name, string pwd)
        {
            string sql = "SELECT COUNT(*) FROM Person WHERE PLoginName=@name and PPwd=@pwd";
            SqlParameter[] ps =
            {
                new SqlParameter("@name", name),
                new SqlParameter("@pwd", pwd)
            };
            return SqlHelper.ExecuteScalar(sql, ps);
        }
        #endregion

    }
}
