using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace resumereport
{
    public partial class CandidateSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["startdate"] = txtDate.Text;
            Session["enddate"] = TextBox2.Text;
            Session["ustartdate"] = TextBox3.Text;
            Session["uenddate"] = TextBox4.Text;
            Session["name"] = TextBox5.Text;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            if (string.IsNullOrEmpty(txtDate.Text) & string.IsNullOrEmpty(TextBox3.Text) & string.IsNullOrEmpty(TextBox5.Text))
            {
                Label10.Text = "Enter atleast one of the search criteria";
            }
            else if (txtDate.Text != "" & string.IsNullOrEmpty(TextBox2.Text))
            {
                Label10.Text = "Please enter end date";
            }
            else if (TextBox3.Text != "" & string.IsNullOrEmpty(TextBox4.Text))
            {
                Label10.Text = "Please enter end date";
            }
            else
            {
                //name = TextBox5.Text;
                //url = "webpageseparated.aspx?startdate=" + TextBox1.Text + "&enddate=" + TextBox2.Text + "";
                // Response.Redirect("webpageseparated.aspx?startdate=" + TextBox1.Text + "&enddate=" + TextBox2.Text,true);
                //Server.Transfer("webpageseparated.aspx", true);
                Response.Redirect("Report.aspx");
            }
        }

    }
}