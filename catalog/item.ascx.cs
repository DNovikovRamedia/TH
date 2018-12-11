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
using Ideal.Core.Imaging;
using Ktk.Model;

public partial class catalog_item : UserWintrol
{
    protected Product Product;

    protected void Page_Load(object sender, EventArgs e)
    {
        Env.CurrentLayout.ContentTitle = "";

        string sid = Env.Request["pid"];
        if (string.IsNullOrEmpty(sid))
            Env.PageNotFound();
        int pid = -1;
        if (!int.TryParse(sid, out pid))
            Env.PageNotFound();
        Product = Ktk.Model.Schema.Products[pid];

        if (null == Product)
        {
            Env.PageNotFound();
        }

        ltName.Text = Product.Name;
        ltCode.Text = Product.Code;
        ltDescr.Text = Product.Description.Html;

        ltImgMain.Text = String.Format(@"<img src='{0}' alt='{1}' />", Product.ImageUrl, Product.Name);

        if (Product.Photos.Count > 0)
        {
            foreach (ImageInfo i in Product.Photos)
            {
                ltImgExt.Text += String.Format(@"<div class='col-md-2 img-prod-little'><img src='{0}/i/p/{1}' alt={2} /></div>", Env.AppPath, i.PreviewName, Product.Name);
            }
        }
    }
}
