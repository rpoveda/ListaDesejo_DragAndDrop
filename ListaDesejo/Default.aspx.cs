using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ListaDesejoMistral
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PopulaProdutos();
        }
        private void PopulaProdutos()
        {
            rptProdutos.DataSource = new BL.BLProduto().listar();
            rptProdutos.DataBind();
        }
    }
}