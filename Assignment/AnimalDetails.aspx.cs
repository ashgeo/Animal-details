using System;
using Newtonsoft.Json.Linq;

namespace Assignment
{
    public partial class AnimalDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    string responseFromServer = RetrieveData.Get("https://tasks.inlogik.com/devtest/animals/detail/" + id);

                    if (responseFromServer != string.Empty)
                    {
                        dynamic data = JObject.Parse(responseFromServer);
                        txtName.Text = data.name;
                        txtType.Text = data.type;
                        string birthday = data.birthday;
                        txtBirthday.Text = String.Format("{0:d}", birthday.Replace("-","/").Replace(" 00:00:00",""));
                        txtWeight.Text = data.weight;
                        chkHasHorns.Checked = data.hasHorns;
                    }
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/AnimalListing.aspx");
        }
    }
}