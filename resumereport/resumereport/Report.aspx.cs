using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace resumereport
{
    public partial class Report : System.Web.UI.Page
    {
        public string totalRecords;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                this.BindGrid();

            }

        }

        protected void BindGrid()
        {

            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["dataconnection"].ToString();
                SqlCommand cmd = new SqlCommand();

                SqlParameter startdate, enddate, ustartdate, uenddate, name;
                cmd.CommandText = "candidateresume";
                cmd.CommandType = CommandType.StoredProcedure;

                startdate = new SqlParameter("@startdate", Session["startdate"]);
                enddate = new SqlParameter("@enddate", Session["enddate"]);
                ustartdate = new SqlParameter("@ustartdate", Session["ustartdate"]);
                uenddate = new SqlParameter("@uenddate", Session["uenddate"]);
                name = new SqlParameter("@name", Session["name"]);

                startdate.Direction = ParameterDirection.Input;
                enddate.Direction = ParameterDirection.Input;
                ustartdate.Direction = ParameterDirection.Input;
                uenddate.Direction = ParameterDirection.Input;
                name.Direction = ParameterDirection.Input;

                startdate.DbType = DbType.String;
                enddate.DbType = DbType.String;
                ustartdate.DbType = DbType.String;
                uenddate.DbType = DbType.String;
                name.DbType = DbType.String;

                cmd.Parameters.Add(startdate);
                cmd.Parameters.Add(enddate);
                cmd.Parameters.Add(ustartdate);
                cmd.Parameters.Add(uenddate);
                cmd.Parameters.Add(name);

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        GridView1.EmptyDataText = "No Records Found";
                        sda.Fill(dt);
                        totalRecords = dt.Rows.Count.ToString();

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }

        }


        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell myCell in e.Row.Cells)
            {
                myCell.Style.Add("word-break", "break-all");
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Candidateresume.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid();

            StringBuilder sb = new StringBuilder();
            sb.Append("\r\n");
            for (int k = 0; k < GridView1.Columns.Count; k++)
            {
                sb.Append(GridView1.Columns[k].HeaderText + ',');
            }
            sb.Append("\r\n");
            foreach (GridViewRow row in GridView1.Rows)
            {

                foreach (TableCell cell in row.Cells)
                {
                    string text = "";
                    if (cell.Controls.Count > 0)
                    {
                        foreach (Control control in cell.Controls)
                        {
                            switch (control.GetType().Name)
                            {
                                case "HyperLink":
                                    text = (control as HyperLink).Text;
                                    break;
                                case "LinkButton":
                                    text = (control as LinkButton).Text;
                                    break;
                            }
                        }
                    }
                    else
                    {
                        text = cell.Text.Replace("&nbsp;", " ");
                    }
                    sb.Append("\"" + text + "\",");
                }
                sb.Append("\r\n");

            }
            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CandidateSearch.aspx");
        }
    }
}