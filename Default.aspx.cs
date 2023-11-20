using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Configuration;

namespace ITAM_webapp_source_code
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //The three "for" statements below will populate the drop down boxes
           //with the month (mm) day (dd) and year (yyyy) 
           //the date selected will be a parameter used for searching for and 
           //reporting on the IT Assets in the database.  
            for (int mm = 1; mm <= 12; mm++)
            {
                DdlMonth.Items.Add(mm.ToString());
            }

            for (int dd = 1; dd <= 31; dd++)
            {
                DdlDay.Items.Add(dd.ToString());
            }

            for (int yyyy = 2010; yyyy <= 2050; yyyy++)
            {
                DdlYear.Items.Add(yyyy.ToString());
            }

            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                    ListBox1.Items.Add(item);
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            foreach (ListItem CBLitem in CheckBoxList1.Items)
                if (CBLitem.Selected)
                {
                    CBLitem.Selected = false;
                }      
        }

        public void LookupBarCode(string myBarCode)
        {
            try
            {

                //Decrypt ConnectionString - value stored encrypted in App.config file along with unencrypted key for decrypting
                string connectionstring = DecryptString(ConfigurationManager.AppSettings.Get("encryptKey"), ConfigurationManager.AppSettings.Get("connectionstring"));
                
                using (SqlConnection conn = new SqlConnection(connectionstring))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        Boolean FoundRecords = false;
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            FoundRecords = true;                           

                        }
                        conn.Close();
                        if (!FoundRecords)
                        {
                            
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                //string connectionstring = DecryptString(ConfigurationManager.AppSettings.Get("encryptKey"), ConfigurationManager.AppSettings.Get("connectionstring"));

               // using (SqlConnection conn = new SqlConnection(connectionstring))
                {
                   // conn.Close();
                  // MessageBox.Show(ex.Message);
                }
            }
        }

        protected void BtnExecuteSearch_Click(object sender, EventArgs e)
        {


        }

        public static string DecryptString(string key, string cipherText)
        {
            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(cipherText);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader((Stream)cryptoStream))
                        {
                            return streamReader.ReadToEnd();
                        }
                    }
                }
            }
        }
    }
}