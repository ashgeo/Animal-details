using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class AnimalListing : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        bool isSearch = false;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["sortOrder"] = string.Empty;
                BindGridView(string.Empty, string.Empty);
            }
        }

        private void BindGridView(string sortExp, string sortDir)
        {
            string responseFromServer = string.Empty;
            lblResult.Text = string.Empty;

            if (isSearch)
                responseFromServer = RetrieveData.Get("https://tasks.inlogik.com/devtest/animals?type=" + txtSearch.Text);
            else
                responseFromServer = RetrieveData.Get("https://tasks.inlogik.com/devtest/animals");

            dt = RetrieveData.DerializeDataTable(responseFromServer);

            if (dt.Rows.Count > 0)
            {
                DataView dv = new DataView();
                dv = dt.DefaultView;

                if (sortExp != string.Empty)
                {
                    dv.Sort = string.Format("{0} {1}", sortExp, sortDir);
                }
                else
                {
                    // Set your deault sort expression and direction.
                    dv.Sort = string.Format("{0} {1}", "name", "asc");
                }

                gvwAnimals.DataSource = dv;
                gvwAnimals.DataBind();
            }
            else
            {
                lblResult.Text = "No records found.";

                gvwAnimals.DataSource = string.Empty;
                gvwAnimals.DataBind();
            }
        }

        public string sortOrder
        {
            get
            {
                if (ViewState["sortOrder"].ToString() == "desc")
                {
                    ViewState["sortOrder"] = "asc";
                }
                else
                {
                    ViewState["sortOrder"] = "desc";
                }

                return ViewState["sortOrder"].ToString();
            }
            set
            {
                ViewState["sortOrder"] = value;
            }
        }

        protected void gvwAnimals_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
        {
            BindGridView(e.SortExpression, sortOrder);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            isSearch = true;

            BindGridView(string.Empty, string.Empty);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //  Simple clean up text to return the Gridview to it's default state
            txtSearch.Text = string.Empty;
            lblResult.Text = string.Empty;
            isSearch = false;

            BindGridView(string.Empty, string.Empty);
        }
    }
}