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



        #region 获取结果集 + static DataTable ExectureTabel(string sql, params SqlParameter[] parameters)
        /// <summary>
        /// 获取结果集
        /// </summary>
        /// <param name="sql">查询命令</param>
        /// <param name="parameters">参数列表</param>
        /// <returns></returns>
        public static DataTable ExectureTabel(string sql, params SqlParameter[] parameters)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connStr);
            DataTable dataTable = new DataTable();

            // 为什么使用 SelectCommand：
            // 因为在 Fill 方法中使用的命令对象就是 SelectCommand，如果将参数赋给其他命令对象，将报错——没有提供某个参数
            dataAdapter.SelectCommand.Parameters.AddRange(parameters);
            dataAdapter.Fill(dataTable);

            return dataTable;
        }
        #endregion
    }
}
