using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace apsnetexam
{
    public partial class MyLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text == "karim" && TextBox2.Text == "123")
            {
                Response.Redirect("/webform1.aspx");
            }
            else
            {
                Response.Write("Invalid");
            }

        }
    }
}