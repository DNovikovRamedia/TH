<%@ WebHandler Language="C#" Class="cartCount" %>

using System;
using System.Web;
using System.Collections.Generic;
using Ideal.Wision;

public class cartCount : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        Ideal.Commerce.Cart ca = Ktk.Model.Commerce.Engine.CurrentCart;
        /*if (ca.IsEmpty)
            context.Response.Write("0");
        else*/        
        context.Response.Write(string.Format("{0}|{1}", ca.Items.Count.ToString(), ca.TotalAmount.ToString("N0"))); 

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}