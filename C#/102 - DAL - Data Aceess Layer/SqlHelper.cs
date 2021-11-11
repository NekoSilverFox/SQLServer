using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace _102___DAL___Data_Aceess_Layer
{
    class SqlHelper
    {
        static string connStr = "Data Source=DESKTOP-HMF772I\\SQLSERVER;Initial Catalog=iTCASTsim;Integrated Security=True";

        #region 执行查询，返回首行首列 +static object ExecuteScalaer(string sql, params SqlParameter[] ps)
        /// <summary>
        ///
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sql, params SqlParameter[] ps)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.Parameters.AddRange(ps);
                return comm.ExecuteScalar();
            }
        }
        #endregion
    }
}
