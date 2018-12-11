using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.Wision.Schema;
using Ideal.Wision;

public partial class order_index : UserWintrol
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "Заказ онлайн";

        xpvChildCategory.List = ProductCategory.RootCategories;
    }
}