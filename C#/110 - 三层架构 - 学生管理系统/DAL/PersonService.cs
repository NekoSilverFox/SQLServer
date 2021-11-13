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


        #region
        /// <summary>
        /// 获取所有人员列表
        /// </summary>
        /// <param name="isDel"></param>
        /// <returns></returns>
        public List<MODEL.Person> GetAllPersonList(bool isDel)
        {
            string sql = "SELECT PID, PCID, Classes.CName AS the_cname, PType, PLoginName, PCName, PPYName, PPwd, PGender, PEmail, PAreas, PIsDel, PAddTime FROM Person INNER JOIN Classes ON Person.PCID=Classes.CID WHERE PIsDel=@idDel";
            SqlParameter parameter = new SqlParameter("@idDel", isDel);

            DataTable dataTable = SqlHelper.ExectureTabel(sql, parameter);
            List<MODEL.Person> personList = null;

            // 判断有没有行
            if (dataTable.Rows.Count > 0)
            {
                personList = new List<MODEL.Person>();

                // 遍历表，将表的每一行转换为对应的实体对象
                foreach(DataRow row in dataTable.Rows)
                {
                    // 每一行数据对应一个 Person 对象
                    MODEL.Person tmpPerson = new MODEL.Person();

                    // 调用方法，将当前的数据行转换为 Person 对象
                    PersonRow2PersonObject(row, tmpPerson);

                    // 将对象添加到集合当中
                    personList.Add(tmpPerson);
                }
            }
            return personList;
        }
        #endregion


        #region 将人员表的数据行转为人员表实体对象 + PersonRow2PersonObject(DataRow row, MODEL.Person person)
        /// <summary>
        /// 将人员表的数据行转为人员表实体对象
        /// </summary>
        /// <param name="row"></param>
        /// <param name="person"></param>
        void PersonRow2PersonObject(DataRow row, MODEL.Person person)
        {

            person.PID = (int)row["PID"];
            person.PCID = (int)row["PCID"];
            // 在获取数据的时候和 dgv 控件做数据绑定的时候，不支持 `表.字段` 的方式
            person.Cname = row["the_cname"].ToString();
            person.PType = (int)row["PType"];
            person.PLoginName = row["PLoginName"].ToString();
            person.PCName = row["PCName"].ToString();
            person.PPYName = row["PPYName"].ToString();
            person.PPwd = row["PPwd"].ToString();
            person.PGender = (bool)row["PGender"];
            person.PEmail = row["PEmail"].ToString();
            person.PAreas = row["PAreas"].ToString();
            person.PIsDel = (bool)row["PIsDel"];
            person.PAddTime = Convert.ToDateTime(row["PAddTime"]);

        }
        #endregion
    }
}
