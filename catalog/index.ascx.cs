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
using System.Collections.Generic;
using Ideal.Wision;
using Ideal.Wision.Identity;
using Ideal.Wision.Controls;
using Ideal.Commerce;
using Ktk.Model;

public partial class catalog_index : UserWintrol
{
    ProductCategory cat;
    Product prod;

    protected void Page_Init(object sender, EventArgs e)
    {
        int id = 0;
        string sid = Env.WisionContext.GetRxKeyValue("cid");
        string cname = "Продукция";
        List<ProductCategory> lpcs = null;
        if (sid != null)
        {
            if (!int.TryParse(sid, out id))
                Env.PageNotFound();
            cat = Ktk.Model.Schema.Categories[id];
            if (null == cat)
                Env.PageNotFound();
            cname = cat.Name;

            lpcs = cat.ChildCategories;
            List<Product> lps = cat.Products;
            if (null != lps)
            {
                if (lps.Count > 0)
                {
                    xpvProducts.Arguments.Add("categoryName", cat.Name);
                    ltDescrCat.Text = cat.Description.ToString();
                    xpvProducts.List = cat.Products;
                    /*xpvProducts.CountPerPage = 20;
                    xpvProducts.ShowPageRange = false;*/
                    phFilter.Visible = true;

                    foreach (string item in Product.ListKartonByProductCategory(lps))
                    {
                        ddlKart.Items.Add(new ListItem(item, item));
                    }
                    foreach (string item in Product.ListConfigByProductCategory(lps))
                    {
                        ddlConf.Items.Add(new ListItem(item, item));                        
                    }

                    List<string> minMax = Product.LengthMinMaxByProductCategory(lps);
                    tbLengthMin.Text = minMax[0];
                    tbLengthMax.Text = minMax[1];
                    minMax = Product.HeightMinMaxByProductCategory(lps);
                    tbHeightMin.Text = minMax[0];
                    tbHeightMax.Text = minMax[1];
                    minMax = Product.WidthMinMaxByProductCategory(lps);
                    tbWidthMin.Text = minMax[0];
                    tbWidthMax.Text = minMax[1];

                    hfCatid.Value = cat.ID.ToString();
                }
            }
        }
        else
        {
            lpcs = ProductCategory.RootCategories;
            phMainDescrCat.Visible = true;
        }

        Env.CurrentLayout.ContentTitle = cname;

        xpvChildCategory.List = lpcs;
    }

    #region INavigable Members

    public INavigator GetNavigator()
    {
        if (null == cat) return new RootProductCategoryNavigator();
        return new ProductCategoryNavigator(cat);
    }

    #endregion

}
