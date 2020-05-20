using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSQLServer
{
    public partial class EditUserInformationById : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int uId=0;
            //check for null
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                //Get Id which is passed with request
                uId = Int32.Parse(Request.QueryString["id"]);
            }
            else
            {
                Response.Write("Id to update user is not provided");
            }
            BusinessLayer.UserInformation userInfo = DBLayer.DBUtilities.SelectUserInformationById(uId);

            //If not POST then save edited data into iserinfo object
            if (!IsPostBack)
            {
                this.firstNameTextBox.Text = userInfo.FirstName;
                this.lastNameTextBox.Text = userInfo.LastName;
                this.addressTextBox.Text = userInfo.Address;
                this.cityTextBox.Text = userInfo.City;
                this.stateOrProvinceTextBox.Text = userInfo.Province;
                this.zipCodeTextBox.Text = userInfo.PostalCode;
                this.countryTextBox.Text = userInfo.Country;
            }
        }

        protected void updateInfoButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //update the user info to the database
                BusinessLayer.UserInformation ui = new BusinessLayer.UserInformation();

                //store all the textbox values into object
                ui.FirstName = Server.HtmlEncode(firstNameTextBox.Text);
                ui.LastName = Server.HtmlEncode(lastNameTextBox.Text);
                ui.Address = Server.HtmlEncode(addressTextBox.Text);
                ui.City = Server.HtmlEncode(cityTextBox.Text);
                ui.Province = Server.HtmlEncode(stateOrProvinceTextBox.Text);
                ui.PostalCode = Server.HtmlEncode(zipCodeTextBox.Text);
                ui.Country = Server.HtmlEncode(countryTextBox.Text);

                int uId = Int32.Parse(Request.QueryString["id"]);
                //call to method to update data with 2 params(id,object) returns inserted record's id
                if (DBLayer.DBUtilities.UpdateUserInformationById(uId, ui) == 1)
                {
                    //display message on success
                    this.lblUpdateResultMessage.Text = "The User Information was successfully updated into database table";
                }
                else
                {
                    //display message on error
                    this.lblUpdateResultMessage.Text = "There was an error while updating the user information!";
                }

            }
        }

        protected void goBackToRegistration_Click(object sender, EventArgs e)
        {
            //Redirect page to Registration Page
            Response.Redirect($"Registration.aspx");
        }
    }
}