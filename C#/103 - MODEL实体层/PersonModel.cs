using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// 用来描述实体结构——表的结构
namespace _103___MODEL实体层
{
    public class PersonModel
    {
		public Person()
		{ }
		#region Model
		private int _pid;
		private int _pcid;
		private int _ptype = 1;
		private string _ploginname;
		private string _pcname;
		private string _ppyname;
		private string _ppwd;
		private bool _pgender = false;
		private string _pemail;
		private string _pareas;
		private bool _pisdel = false;
		private DateTime _paddtime = DateTime.Now;
		/// <summary>
		/// 学生表ID
		/// </summary>
		public int PID
		{
			set { _pid = value; }
			get { return _pid; }
		}
		/// <summary>
		/// 所属班级ID(外键)
		/// </summary>
		public int PCID
		{
			set { _pcid = value; }
			get { return _pcid; }
		}
		/// <summary>
		/// 人员类型(1-学生,2-老师)
		/// </summary>
		public int PType
		{
			set { _ptype = value; }
			get { return _ptype; }
		}
		/// <summary>
		/// 登录名
		/// </summary>
		public string PLoginName
		{
			set { _ploginname = value; }
			get { return _ploginname; }
		}
		/// <summary>
		/// 真实姓名
		/// </summary>
		public string PCName
		{
			set { _pcname = value; }
			get { return _pcname; }
		}
		/// <summary>
		/// 姓名拼音
		/// </summary>
		public string PPYName
		{
			set { _ppyname = value; }
			get { return _ppyname; }
		}
		/// <summary>
		/// 密码
		/// </summary>
		public string PPwd
		{
			set { _ppwd = value; }
			get { return _ppwd; }
		}
		/// <summary>
		/// 性别
		/// </summary>
		public bool PGender
		{
			set { _pgender = value; }
			get { return _pgender; }
		}
		/// <summary>
		/// 电子邮件地址
		/// </summary>
		public string PEmail
		{
			set { _pemail = value; }
			get { return _pemail; }
		}
		/// <summary>
		///
		/// </summary>
		public string PAreas
		{
			set { _pareas = value; }
			get { return _pareas; }
		}
		/// <summary>
		/// 删除标志
		/// </summary>
		public bool PIsDel
		{
			set { _pisdel = value; }
			get { return _pisdel; }
		}
		/// <summary>
		/// 录入时间
		/// </summary>
		public DateTime PAddTime
		{
			set { _paddtime = value; }
			get { return _paddtime; }
		}
		#endregion Model

	}
}
