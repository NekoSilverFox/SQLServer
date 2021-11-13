using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    // 改为 public
    public class ClassesManager
    {

        DAL.ClassesService classesManager = new DAL.ClassesService();


        #region 获取所有班级信息 + List<MODEL.Classes> getAllClasses(cisDel)
        /// <summary>
        /// 获取所有班级信息
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public List<MODEL.Classes> getAllClassesList(bool cisDel)
        {
            return classesManager.getAllClassesList(cisDel);
        }
        #endregion
    }
}
