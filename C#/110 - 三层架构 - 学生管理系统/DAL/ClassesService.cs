using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    // 注意改为public
    public class ClassesService
    {
        #region 获取所有班级信息 + List<MODEL.Classes> getAllClasses(cisDel)
        /// <summary>
        /// 获取所有班级信息
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public List<MODEL.Classes> getAllClassesList(bool cisDel)
        {
            string sql = "SELECT CID, Cname, Ccount, cimg, Cisdel, Caddtime, FROM Classes WHERE cisdel=@isDel";
            SqlParameter parameter = new SqlParameter("@isDel", cisDel);
            DataTable dataTable = SqlHelper.ExectureTabel(sql, parameter);
            // 将表的每一行数据转换为对象然后添加到集合中。因为表的每一行，每一列是一个 Object ，如果后期在控件中修改的话要在对象中做
            List<MODEL.Classes> classesList = null;
            if(dataTable.Rows.Count > 0)
            {
                // 一定要实例化对象的数据！
                classesList = new List<MODEL.Classes>();

                foreach (DataRow row in dataTable.Rows)
                {
                    // 每一行就对应着一条数据
                    MODEL.Classes tmpClasses = new MODEL.Classes();
                    ClassesRow2ClassesObject(row, tmpClasses);
                    // 将当前生成的对象添加到集合中
                    classesList.Add(tmpClasses);
                }
            }

            return classesList;
        }
        #endregion


        #region 将 classes 数据行转换为Classes 对象 + void ClassesRow2ClassesObject(DataRow row, MODEL.Classes classes)
        /// <summary>
        /// 将 classes 数据行转换为Classes 对象
        /// </summary>
        /// <param name="row"></param>
        /// <param name="classes"></param>
        void ClassesRow2ClassesObject(DataRow row, MODEL.Classes classes)
        {
            classes.CID = (int)row["CID"];
            classes.CName = row["CName"].ToString();
            classes.CCount = (int)row["CCount"];
            classes.CImg = row["CImg"].ToString();
            classes.CIsDel = (bool)row["CIsDel"];
            classes.CAddTime = Convert.ToDateTime(row["CAddTime"]);
        }
        #endregion
    }
}
