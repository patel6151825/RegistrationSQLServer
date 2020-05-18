using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSQLServer
{
    public partial class Registration : System.Web.UI.Page
    {
        private int res;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void enterInfoButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //send the user info to the database
                BusinessLayer.UserInformation userInfo = new BusinessLayer.UserInformation();

                userInfo.FirstName = Server.HtmlEncode(firstNameTextBox.Text);
                userInfo.LastName = Server.HtmlEncode(lastNameTextBox.Text);
                userInfo.Address = Server.HtmlEncode(addressTextBox.Text);
                userInfo.City = Server.HtmlEncode(cityTextBox.Text);
                userInfo.Province = Server.HtmlEncode(stateOrProvinceTextBox.Text);
                userInfo.PostalCode = Server.HtmlEncode(zipCodeTextBox.Text);
                userInfo.Country = Server.HtmlEncode(countryTextBox.Text);

                res = DBLayer.DBUtilities.InsertUserInformation(userInfo);
                //store the returned new id into session object
                Session["id"] = res;
                if ( res!=-1)
                {
                    this.lblResultMessage.Text = "The User Information was successfully inserted into database table";
                    this.editInfoButton.Visible = true;
                }
                else
                {
                    this.lblResultMessage.Text = "There was an error while inserting the user information!";
                }
                    
            }
        }

        protected void editInfoButton_Click(object sender, EventArgs e)
        {
            int uid = Convert.ToInt32(Session["id"]);
            Response.Redirect($"EditUserInformationById.aspx?id={uid}");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //method to clear all textboxes
            resetTextBoxes();
        }

        private void resetTextBoxes()
        {
            firstNameTextBox.Text = "";
            lastNameTextBox.Text = "";
            addressTextBox.Text = "";
            cityTextBox.Text = "";
            stateOrProvinceTextBox.Text = "";
            zipCodeTextBox.Text = "";
            countryTextBox.Text = "";
        }
    }
}