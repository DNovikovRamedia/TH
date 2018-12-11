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
using System.Collections.Generic;
using Ideal.Entity;
using Ktk.Model;
using Ideal.Wision.Identity;

public partial class KtkLayout : Layout
{

    static bool comminit = false;

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!comminit)
        {
            string ap = Ideal.Wision.Env.AppPath;
            Commerce.Initialize();
            Ideal.Commerce.Cart cart = Commerce.Engine.CurrentCart;
            comminit = true;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (ProductCategory pc in ProductCategory.RootCategories)
        {
            ltCategories.Text += string.Format("<li><a href='/catalog/{0}/'>{1}</a></li>", pc.ID, pc.Name);
        }
    }

    protected override Container DefaultContainer
    {
        get { return contDefault; }
    }

    protected override void Render(HtmlTextWriter writer)
    {
        if (null != Env.CurrentLayout.ContentTitle)
        {
            if (Env.CurrentLayout.ContentTitle.Length > 0)
            {
                this.Header.Title = "ТехноХолод: " + Env.CurrentLayout.ContentTitle;
            }
            else
            {
                this.Header.Title = "ТехноХолод";
            }
        }
        base.Render(writer);
    }
}