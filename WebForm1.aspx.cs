using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apsnetexam
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox a = (TextBox)DetailsView1.FindControl("TextBox5");
            FileUpload b = (FileUpload)DetailsView1.FindControl("FileUpload1");
            if(b.HasFile)
            {
                b.SaveAs(Server.MapPath("~/images/") + b.FileName);
                Image c = (Image)DetailsView1.FindControl("Image3");
                c.ImageUrl = "~/images/" + b.FileName;
                a.Text = b.FileName;
            }
        }

        private static void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    } }
