using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODEL
{
	// 注意改为 public
    public class Classes
    {
		public Classes()
		{ }
		#region Model
		private int _cid;
		private string _cname;
		private int _ccount;
		private string _cimg = "nojpg.jpg";
		private bool _cisdel = false;
		private DateTime _caddtime = DateTime.Now;
		/// <summary>
		/// 班级表ID
		/// </summary>
		public int CID
		{
			set { _cid = value; }
			get { return _cid; }
		}
		/// <summary>
		/// 班级名称
		/// </summary>
		public string CName
		{
			set { _cname = value; }
			get { return _cname; }
		}
		/// <summary>
		/// 班级人数
		/// </summary>
		public int CCount
		{
			set { _ccount = value; }
			get { return _ccount; }
		}
		/// <summary>
		/// 班级Logo图片
		/// </summary>
		public string CImg
		{
			set { _cimg = value; }
			get { return _cimg; }
		}
		/// <summary>
		/// 删除标志
		/// </summary>
		public bool CIsDel
		{
			set { _cisdel = value; }
			get { return _cisdel; }
		}
		/// <summary>
		/// 录入时间
		/// </summary>
		public DateTime CAddTime
		{
			set { _caddtime = value; }
			get { return _caddtime; }
		}
		#endregion Model

	}
}
