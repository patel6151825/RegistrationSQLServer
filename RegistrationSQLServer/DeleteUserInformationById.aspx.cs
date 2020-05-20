using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSQLServer
{
    public partial class DeleteUserInformationById : System.Web.UI.Page
    {
        private int GetUserId()
        {
            int uId = 0;
            //check for null
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                //Get Id which is passed with request
                uId = Int32.Parse(Request.QueryString["id"]);
            }
            return uId;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int result = 0;
                try
                {
                    result = DBLayer.DBUtilities.DeleteUserInformationById(GetUserId());
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }

                if (result == 1)
                {
                    LblDeleteResultMessage.Text = $"The User Information with id={GetUserId()} was successfully deleted from database table";
                }
                else
                {
                    LblDeleteResultMessage.Text = "There was an error while deleting the user information!";
                }
            }
        }
    }
}