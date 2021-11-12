using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class PersonService
    {
        #region 实现登录 +MODEL.Person Login(string name)
        /// <summary>
        /// 实现登录
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public MODEL.Person Login(string name)
        {
            string sql = "SELECT PID, PCID, PType, PLoginName, PCName, PPYName, PPwd, PGender, PEmail, PAreas, PIsDel, PAddTime FROM Person WHERE PIsDel=0 AND PLoginName=@name";

            SqlParameter parameter = new SqlParameter("@name", name);

            MODEL.Person person = null;

            using (SqlDataReader reader = SqlHelper.ExecuteReader(sql, parameter))  // SqlHelper.ExecuteReader(sql, parameter) 中合并 sql 语句中的各个参数
            {
                //声明实体对象
                if (reader.Read())  // 就算有数据，也就一行。所以没有必要循环！
                {
                    person = new MODEL.Person();

                    person.PID = (int)reader["PID"];
                    person.PCID = (int)reader["PCID"];
                    person.PType = (int)reader["PType"];
                    person.PLoginName = reader["PLoginName"].ToString();
                    person.PCName = reader["PCName"].ToString();
                    person.PPYName = reader["PPYName"].ToString();
                    person.PPwd = reader["PPwd"].ToString();
                    person.PGender = (bool)reader["PGender"];
                    person.PEmail = reader["PEmail"].ToString();
                    person.PAreas = reader["PAreas"].ToString();
                    person.PIsDel = (bool)reader["PIsDel"];
                    person.PAddTime = Convert.ToDateTime(reader["PAddTime"]);

                }
            }
            return person;
        }
        #endregion

    }
}
