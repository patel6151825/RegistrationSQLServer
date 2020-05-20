using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RegistrationSQLServer.DBLayer
{
    public class DBUtilities
    {
        private static SqlConnection GetSqlConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString();

            return new SqlConnection(connectionString);

        }

        //To Insert user Information
        public static int InsertUserInformation(BusinessLayer.UserInformation ui)
        {

            int result;
            int newId=-1;
            using (SqlConnection cnn = GetSqlConnection())
            {
                String sql = $"Insert into UserInformation(FirstName,LastName,Address,City,Province,PostalCode,Country) values ('{ui.FirstName}','{ui.LastName}','{ui.Address}','{ui.City}','{ui.Province}','{ui.PostalCode}','{ui.Country}')";

                using (SqlCommand command = new SqlCommand(sql, cnn))
                {
                    //open connection
                    cnn.Open();

                    command.CommandType = System.Data.CommandType.Text;
                    command.CommandText = sql;
                    //execute query
                    result = command.ExecuteNonQuery();

                    //select id of newly added record
                    string query2 = "Select @@Identity as newId from UserInformation";
                    command.CommandText = query2;

                    newId = Convert.ToInt32(command.ExecuteScalar());

                }
            }
            return newId;
        
        }


        //To Select user Information depends on Id given
        public static BusinessLayer.UserInformation SelectUserInformationById(int userId)
        {
            BusinessLayer.UserInformation userInformation = new BusinessLayer.UserInformation();

            using (SqlConnection cnn = GetSqlConnection())
            {
                String sql = $"Select * From UserInformation Where Id = {userId}";

                using (SqlCommand command = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    using (SqlDataReader dataReader = command.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            userInformation.Id = (int)dataReader.GetValue(0);
                            userInformation.FirstName = (string)dataReader.GetValue(1);
                            userInformation.LastName = (string)dataReader.GetValue(2);
                            userInformation.Address = (string)dataReader.GetValue(3);
                            userInformation.City = (string)dataReader.GetValue(4);
                            userInformation.Province = (string)dataReader.GetValue(5);
                            userInformation.PostalCode = (string)dataReader.GetValue(6);
                            userInformation.Country = (string)dataReader.GetValue(7);
                        }
                    }
                }
            }

            return userInformation;
        }


        //To Update user Information depends on Id given
        public static int UpdateUserInformationById(int userId, BusinessLayer.UserInformation ui)
        {
            int result;

            using (SqlConnection cnn = GetSqlConnection())
            {
                String sql = $"Update UserInformation Set FirstName='{ui.FirstName}',LastName='{ui.LastName}',Address='{ui.Address}',City='{ui.City}',Province='{ui.Province}',PostalCode='{ui.PostalCode}',Country='{ui.Country}' Where Id = {userId}";

                using (SqlCommand command = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    command.CommandType = System.Data.CommandType.Text;
                    command.CommandText = sql;
                    result = command.ExecuteNonQuery();
                }
            }

            return result;
        }

        //To Delete user Information depends on Id given
        public static int DeleteUserInformationById(int userId)
        {
            int result;

            using (SqlConnection cnn = GetSqlConnection())
            {
                String sql = $"Delete from UserInformation Where Id = {userId}";

                using (SqlCommand command = new SqlCommand(sql, cnn))
                {
                    cnn.Open();

                    command.CommandType = System.Data.CommandType.Text;
                    command.CommandText = sql;
                    result = command.ExecuteNonQuery();
                }
            }

            return result;
        }
    }
}