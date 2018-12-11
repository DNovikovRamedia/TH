<%@ WebHandler Language="C#" Class="cart" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class cart : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string pid = context.Request["pid"];
        string scount = context.Request["count"];
        string length = context.Request["length"];
        string width = context.Request["width"];
        string height = context.Request["height"];
        string karton = context.Request["karton"];
        string config = context.Request["config"];
        int count = 0;
        if (null != pid)
        {            
                Ktk.Model.Product prod = Ktk.Model.Schema.Products[int.Parse(pid)];
                if (null != prod)
                {                    
                    if (!String.IsNullOrEmpty(scount) && int.TryParse(scount, out count))
                    {
                        Ideal.Core.Settings.SettingsCollection sc = new Ideal.Core.Settings.SettingsCollection();                        
                        sc.SetSettingsValue("length", length);
                        sc.SetSettingsValue("width", width);
                        sc.SetSettingsValue("height", height);
                        sc.SetSettingsValue("karton", karton);
                        sc.SetSettingsValue("config", config);
                        
                        Ideal.Commerce.Engine.Current.CurrentCart.Items.Add(prod, count, sc);
                    }
                    else
                    {
                        Ideal.Commerce.Engine.Current.CurrentCart.Items.Add(prod);
                    }
                }            
        }
        
        Ideal.Commerce.Cart ca = Ktk.Model.Commerce.Engine.CurrentCart;
        if (ca.IsEmpty)            
            context.Response.Write("пуста");
        else
        context.Response.Write(string.Format("Услуг: <b id='count-service'>{0}</b> на <b id='price-service'>{1:n2}</b> руб.", ca.Items.Count, ca.TotalAmount));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }    
}