using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _010___省市级联
{
    /// <summary>
    /// 实体类：用来描述数据源的结构 —— 数据源往往只是一张表
    /// </summary>
    class Areas
    {
        public Areas()
        {

        }

        public Areas(int aid, string aname)
        {
            this.aid = aid;
            this.aname = aname;
        }



        // 快速封装：Ctrl+R 然后 Ctrl+E；https://docs.microsoft.com/zh-cn/visualstudio/ide/reference/encapsulate-field?view=vs-2019
        int aid;
        string aname;

        /// <summary>
        /// 省市编号
        /// </summary>
        public int Aid { get => aid; set => aid = value; }

        /// <summary>
        /// 省市名称
        /// </summary>
        public string Aname { get => aname; set => aname = value; }
    }
}
