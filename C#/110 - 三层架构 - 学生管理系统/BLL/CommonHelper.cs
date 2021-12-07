using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace BLL
{
    public class CommonHelper
    {

        #region winform 中自带方法实现MD5加密 +static string GetMD5Form(string pwd)
        /// <summary>
        /// winform 中自带方法实现MD5加密
        /// </summary>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public static string GetMD5(string pwd)
        {
            MD5 md5 = MD5.Create();
            byte[] pwdBytes = Encoding.Default.GetBytes(pwd);
            pwdBytes = md5.ComputeHash(pwdBytes);

            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < pwdBytes.Length; i++)
            {
                stringBuilder.Append(pwdBytes[i].ToString("X2"));
            }

            return stringBuilder.ToString();
        }
        #endregion
    }
}
