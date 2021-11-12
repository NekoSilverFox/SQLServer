using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    class SqlHelper
    {
        static string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        #region 返回数据读取器对象 +static SqlDataReader ExecuteReader(string sql, params SqlParameter[] parameters)
        /// <summary>
        /// 返回数据读取器对象
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] parameters)
        {
            // 【重点】这里不需要释放连接通道，因为释放了连接通道，读取器对象也会被释放！
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand comm = new SqlCommand(sql, conn);
            comm.Parameters.AddRange(parameters);

            // 参数说明：以后关闭读取器的时候，使用的连接通道也会被关闭
            return comm.ExecuteReader(CommandBehavior.CloseConnection);
        }
        #endregion
    }
}
