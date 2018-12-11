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
using Ideal.Commerce;
using Ideal.Wision;
using System.Text;
using Ideal.Wision.Identity;
using Ideal.Core.Net;
using Ideal.Wision.IO;
using Aspose.Excel;
using System.Collections.Generic;
using Ktk.Model;

public partial class catalog_cart : UserWintrol, IPostBackEventHandler
{
    Cart c = Commerce.Engine.CurrentCart;

    void Show(string what)
    {
        pnlCheckout.Visible = false;
        pnlItems.Visible = false;
        pnlNoItems.Visible = false;
        pnlDetails.Visible = false;

        switch (what)
        {
            case "check": pnlCheckout.Visible = true;
                return;

            case "items": pnlItems.Visible = true;
                return;

            case "noitems": pnlNoItems.Visible = true;
                return;

            case "details": pnlDetails.Visible = true;
                return;
        }
    }

    private void BindCart()
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCart();

            if (c.Items.Count > 0)
                Show("items");
            else
                Show("noitems");
        }

        Env.CurrentLayout.ContentTitle = "Моя корзина";

        this.PreRender += new EventHandler(cart_PreRender);
    }

    //double totalWeight = 0;

    private void RenderCart()
    {
        StringBuilder sb = new StringBuilder();

        sb.Append(@"
<table class=""services"" align=""center"">
<thead>
	<tr style='background-color:#d7d7d7;'>
        <td align=""center"" style='font-weight:bold;'></td>	
        <td align=""center"" style='font-weight:bold;'>Название</td>	
        <td align=""center"" style='font-weight:bold;width: 120px;'>Цена за шт.</td>
        <td align=""center"" style='font-weight:bold;width: 120px;'>Количество</td>
		<td align=""center"" style='font-weight:bold;width: 75px;'>Удалить</td>
	</tr>
</thead>

<tbody>");

        //totalWeight = 0;


        List<CartItem> lci = new List<CartItem>();/*СОРТИРОВКА ПО НАЗВАНИЮ КАТЕГОРИИ!!!*/
        foreach (CartItem ci in c.Items)
        {
            lci.Add(ci);
        }
        lci.Sort(delegate(CartItem x, CartItem y)
        {
            Product prodx = (Product)x.Product;
            Product prody = (Product)y.Product;
            int ix = prodx.RootCategory.Name.CompareTo(prody.RootCategory.Name);
            if (ix != 0)
                return ix;
            ix = prodx.ParentCategory.Name.CompareTo(prody.ParentCategory.Name);
            if (ix != 0)
                return ix;

            return prodx.Name.CompareTo(prody.Name);
        });

        string strCatName = string.Empty;
        string strParentCatName = string.Empty;
        foreach (CartItem ci in lci)
        //foreach (CartItem ci in c.Items)
        {
            Product prod = (Product)ci.Product;
            string pid = prod.ID.ToString();

            string settings = String.Empty;
            string value = ci.CustomSettings.GetSettingsValue("length");
            if (!String.IsNullOrEmpty(value))
                settings = "Длина: " + value + "<br />";
            value = ci.CustomSettings.GetSettingsValue("width");
            if (!String.IsNullOrEmpty(value))
                settings += "Ширина: " + value + "<br />";
            value = ci.CustomSettings.GetSettingsValue("height");
            if (!String.IsNullOrEmpty(value))
                settings += "Высота: " + value + "<br />";
            value = ci.CustomSettings.GetSettingsValue("karton");
            if (!String.IsNullOrEmpty(value))
                settings += "Картон: " + value + "<br />";
            value = ci.CustomSettings.GetSettingsValue("config");
            if (!String.IsNullOrEmpty(value))
                settings += "Конфигурация: " + value;

            if (strCatName != prod.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td colspan='5'><div class='rasp'></div></td></tr>");
                sb.AppendFormat(@"<tr><td class='cat-name' colspan='5'><b>{0}</b></td></tr>", prod.RootCategory.Name);
            }
            strCatName = prod.RootCategory.Name;

            /*if (strParentCatName != prod.ParentCategory.Name && prod.ParentCategory.Name != prod.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td class='cat-name middle-cat' colspan='4'><b>{0}</b></td></tr>", prod.ParentCategory.Name);
            }
            strParentCatName = prod.ParentCategory.Name;*/

            sb.AppendFormat(@"
	<tr  class='middle-cat'>
        <td style='text-align: center; width:180px;'><img class='img-cart' src='{7}/i/p/{0}' alt='{11}' /></td>
        <td style='text-align: center'>
            <div style='font-weight:bold; font-size:12pt; margin-bottom:10px;'>{11}</div>
            <div>{8}</div>
        </td>
        <td style='text-align: center'>{9}</td>
        <td style='text-align: center' nowrap=""nowrap""><input type=""text"" name=""qty{3}"" value=""{4}"" class=""wide form-control"" style=""width: 45px; border: solid 1px #999999;"" /></td>
		<td align=""center"" width=""30px""><a href=""javascript:{6}""><img src=""{7}/ii/del.gif"" height=""26"" alt=""Удалить"" /></a></td>
	</tr>
", prod.Photo.PreviewName, prod.Articul, "", ci.ID.ToString(), ci.Quantity, "",
 this.Page.ClientScript.GetPostBackEventReference(this, "rem" + ci.ID.ToString()),
 Env.AppPath, settings, (ci.ProductPrice > 0) ? ci.ProductPrice.ToString("N1") + " руб." : ci.ProductPrice.ToString("N1"), ci.ID, ci.ProductTitle, "");

        }

        sb.AppendFormat(@"
	<tr>		
		<td style='text-align:right !important;'><b>ИТОГО:</b></td>
        <td align=""center""><b>{0:n0} руб.</b></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</tbody>
</table>", c.TotalAmount);

        this.ltCart.Text = sb.ToString();

    }


    void cart_PreRender(object sender, EventArgs e)
    {
        RenderCart();
        //this.labTotal.Text = string.Format("В Вашей корзине <b>{0}</b> позиций общим весом <b>{1}</b> г.", c.Items.Count, totalWeight);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateCart();
    }

    private void UpdateCart()
    {

        foreach (string key in Request.Form.AllKeys)
        {
            if (key.Length > 3)
            {
                if (key.Substring(0, 3).ToLower() == "qty")
                {
                    CartItem ci = c.Items.GetItem(new Guid((key.Remove(0, 3))));
                    if (null != ci)
                    {
                        int qty = 0;
                        if (Int32.TryParse(Request.Form[key], out qty))
                        {
                            if (qty <= 0)
                                ci.Remove();
                            else
                            {
                                Product p = Schema.Products.SelectSingle("GID = @1", ci.ProductID);
                                if (p != null)
                                {
                                    //if (qty > p.WarehouseCount)
                                    //{
                                    //    Env.RegisterStartupMessage("warehouseCountMessage", "На складе нет указанного количества товара!");
                                    //    qty = p.WarehouseCount;
                                    //}
                                }
                                ci.Quantity = qty;
                                ci.Update();
                            }
                        }
                    }
                }
            }
        }

        BindCart();
    }

    protected void btnOrderIt_Click(object sender, EventArgs e)
    {
        UpdateCart();

        if (c.Items.Count == 0)
            return;

        Order o = c.CheckOut();
        //labOrder.Text = o.Number.ToString();        
        //o.CustomerText += "E-mail: " + tbEmail.Text.Trim() + "<br />";                
        o.CustomerText += tbRemarks.Text.Trim();
        o.CustomerText += "<br />ФИО заказчика: " + tbFIO.Text.Trim() + "<br />";
        o.CustomerText += "Электронная почта: " + tbMail.Text.Trim() + "<br />";
        o.Update();

        SendEmail(o);

        Show("check");
    }

    protected void btnClean_Click(object sender, EventArgs e)
    {
        c.Items.RemoveAll();
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        Show("details");
    }

    #region IPostBackEventHandler Members

    void IPostBackEventHandler.RaisePostBackEvent(string eventArgument)
    {
        if (eventArgument.Length > 3)
        {
            if (eventArgument.Substring(0, 3).ToLower() == "rem")
            {
                CartItem ci = c.Items.GetItem(new Guid(eventArgument.Remove(0, 3)));
                if (ci != null)
                    ci.Remove();
            }
        }

        if (c.ItemCount == 0)
            Env.RedirectToItself();
    }

    #endregion


    void SendEmail(Order order)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<table cellpadding='3' cellspacing='0'>");
        sb.Append(String.Format(@"<tr><td><b>Дата заказа</b></td><td><b>{0}</b></td></tr>", DateTime.Now.ToLongDateString()));
        sb.Append(String.Format(@"<tr><td><b>Номер заказа</b></td><td><b>{0}</b></td></tr>", order.Number.ToString()));

        sb.Append(String.Format(@"<tr><td>Название организации</td><td>{0}</td></tr>", tbNameOrg.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Контактное лицо</td><td>{0}</td></tr>", tbFIO.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Контактный телефон</td><td>{0}</td></tr>", tbPhone.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Электронная почта</td><td>{0}</td></tr>", tbMail.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Количество цветов печати</td><td>{0}</td></tr>", tbColor.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Тираж</td><td>{0}</td></tr>", tbCount.Text.Trim()));
        sb.Append(String.Format(@"<tr><td>Комментарий</td><td>{0}</td></tr>", tbRemarks.Text.Trim()));
        sb.Append("</table>");

        sb.Append("<br /><table cellpadding='3' cellspacing='0' border='1px'>");
        sb.Append(String.Format(@"<tr><td colspan='5'><b>Данные по заказу</b></td></tr>"));
        sb.Append(String.Format(@"<tr><td><b>№</b></td><td><b>Название</b></td><td><b>Кол-во</b></td><td><b>Цена за шт.</b></td><td><b>Сумма</b></td></tr>"));

        int i = 1;
        double itemsCount = 0;

        List<OrderItem> lci = new List<OrderItem>();/*СОРТИРОВКА ПО НАЗВАНИЮ КАТЕГОРИИ!!!*/
        foreach (OrderItem ci in order.Items)
        {
            lci.Add(ci);
        }
        lci.Sort(delegate(OrderItem x, OrderItem y)
        {
            Product prodx = (Product)x.Product;
            Product prody = (Product)y.Product;
            int ix = prodx.RootCategory.Name.CompareTo(prody.RootCategory.Name);
            if (ix != 0)
                return ix;
            ix = prodx.ParentCategory.Name.CompareTo(prody.ParentCategory.Name);
            if (ix != 0)
                return ix;

            return prodx.Name.CompareTo(prody.Name);
        });

        string strCatName1 = string.Empty;
        string strParentCatName1 = string.Empty;

        foreach (OrderItem oi in lci)
        {

            string settings = String.Empty;           
            string value = oi.CustomSettings.GetSettingsValue("length");
            if (!String.IsNullOrEmpty(value))
                settings = "Длина: " + value + "<br />";
            value = oi.CustomSettings.GetSettingsValue("width");
            if (!String.IsNullOrEmpty(value))
                settings += "Ширина: " + value + "<br />";
            value = oi.CustomSettings.GetSettingsValue("height");
            if (!String.IsNullOrEmpty(value))
                settings += "Высота: " + value + "<br />";
            value = oi.CustomSettings.GetSettingsValue("karton");
            if (!String.IsNullOrEmpty(value))
                settings += "Картон: " + value + "<br />";
            value = oi.CustomSettings.GetSettingsValue("config");
            if (!String.IsNullOrEmpty(value))
                settings += "Конфигурация: " + value;

            Product p = oi.Product as Product;
            if (strCatName1 != p.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td colspan='5'><div class='rasp'></div></td></tr>");
                sb.AppendFormat(@"<tr><td align='center' class='cat-name' colspan='5'><b>{0}</b></td></tr>", p.RootCategory.Name);
            }
            strCatName1 = p.RootCategory.Name;

            if (strParentCatName1 != p.ParentCategory.Name && p.ParentCategory.Name != p.RootCategory.Name)
            {
                sb.AppendFormat(@"<tr><td align='center' class='cat-name middle-cat' colspan='5'><b>{0}</b></td></tr>", p.ParentCategory.Name);
            }
            strParentCatName1 = p.ParentCategory.Name;

            sb.Append(String.Format(@"<tr><td>{0}</td><td><b>{1}</b><br />{5}</td><td>{2} шт.</td><td>{3} руб.</td><td>{4} руб.</td></tr>", i.ToString(), oi.ProductTitle, oi.Quantity.ToString(), oi.Price.ToString(), oi.Amount.ToString(), settings));
            i++;
            itemsCount += oi.Quantity;
        }
        sb.Append(String.Format(@"<tr><td colspan='2'><b>Итого:</b></td><td><b>{0} шт.</b></td><td>&nbsp;</td><td><b>{1} руб.</b></td></tr>", itemsCount.ToString(), order.TotalAmount.ToString("c")));
        sb.Append("</table>");
        //sb.Append("Наш менеджер свяжется с Вами в ближайшее время, чтобы уточнить вопросы по заказу услуг и предложить оптимальный способ его выполнения.");

        /*отправка сообщения администратору сайта*/
        SmtpPerson sp = new SmtpPerson("info@ramedia.ru", tbFIO.Text.Trim());
        SmtpPerson sa = null;
        SmtpMessage sm = null;
        foreach (string email in Variables.OrderEmails)
        {
            sa = new SmtpPerson(email, "Администратор");
            sm = new SmtpMessage(sp, sa, false);
            sm.Subject = @"Картон Тара Кострома";
            sm.Body = sb.ToString();
            sm.IsHtml = true;
            Mail.Send(sm);
        }

        /*отправка сообщения заказчику*/
        sb.Insert(0, "Мы благодарим Вас за заказ на нашем сайте!");
        sa = new SmtpPerson("info@ramedia.ru", "Картон Тара Кострома");
        sm = new SmtpMessage(sa, sp, false);
        sm.Subject = @"Картон Тара Кострома";
        sm.Body = sb.ToString();
        sm.IsHtml = true;
        //Mail.Send(sm);

        //Mail.SendFromAdmin(new SmtpPerson("p.smirnova@ramedia.ru", "Полина"), "Запрос со СтройКомплектГрупп", sb.ToString());        

    }
}
