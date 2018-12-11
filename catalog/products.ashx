<%@ WebHandler Language="C#" Class="products" %>

using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Text;
using System.Web;
using System.Web.UI;
using Ideal.Core.Xml;
using Ideal.Wision.Controls;
using Ideal.Entity;
using Ktk.Model;

public class products : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        lock (typeof(products))
        {
            context.Response.ContentType = "application/json";

            StringBuilder sb = null;
            StringWriter sw = null;

            FilterResults fr = new FilterResults();
            //fr.CurrentPage = context.Request["page"];
            fr.CurrentPage = "1";
            fr.CatId = context.Request["catId"];
            fr.Karton = context.Request["karton"];
            fr.Config = context.Request["config"];
            fr.MinLength = context.Request["minLength"];
            fr.MaxLength = context.Request["maxLength"];
            fr.MinHeight = context.Request["minHeight"];
            fr.MaxHeight = context.Request["maxHeight"];
            fr.MinWidth = context.Request["minWidth"];
            fr.MaxWidth = context.Request["maxWidth"];
            fr.TypeLoad = context.Request["typeLoad"];
            
            FilterResultsJson frj = new FilterResultsJson();
            frj.CurrentPage = fr.CurrentPage;
            if (fr.ListProduct.Count > 0)
            {
                Type oExtractable = typeof(Product);
                XmlDocumentBuilder xdb = new XmlDocumentBuilder(fr.ListProduct, oExtractable, new List<object>());
                XmlDocument xdoc = xdb.GetDocument();
                XslCompiledTransform trans = new XslCompiledTransform();
                XPathDocument xpd = new XPathDocument(Ideal.Wision.Env.Server.MapPath("~/xsl/catalog.xsl"));
                trans.Load(xpd);
                XsltArgumentList xal = new XsltArgumentList();
                xal.AddParam("appPath", "", Ideal.Wision.Env.AppPath);
                //xal.AddParam("rand", "", DateTime.Now.Ticks.ToString());
                sb = new StringBuilder();
                sw = new StringWriter(sb);
                trans.Transform(xdoc, xal, sw);                                

                frj.ProductsHtml = sb.ToString();
                frj.YepNope = fr.YepNope;
            }
            else
            {
                frj.ProductsHtml = "<div class='alert'>Нет товаров, удовлетворяющих поиску</div>";
                frj.YepNope = "0";
            }

            Newtonsoft.Json.JsonSerializer js = new Newtonsoft.Json.JsonSerializer();
            sb = new StringBuilder();
            sw = new StringWriter(sb);
            js.Serialize(sw, frj);
            string str = sb.ToString();
            context.Response.Write(str);
            context.Response.Flush();
        }
    }
    
    internal bool Has(int[] values, int val)
    {
        for (int i = 0; i < values.Length ; i++)
        {
            if (values[i] == val)
            {
                return true;
            }
        }

        return false;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

class FilterResults
{
    string currentPage = string.Empty;
    public string CurrentPage
    {
        get { return currentPage; }
        set { currentPage = value; }
    }

    string totalPage = string.Empty;
    public string TotalPage
    {
        get { return totalPage; }
        set { totalPage = value; }
    }

    string catId = string.Empty;
    public string CatId
    {
        get { return catId; }
        set { catId = value; }
    }

    string yepNope = string.Empty;
    public string YepNope
    {
        get { return yepNope; }
        set { yepNope = value; }
    }

    string karton = string.Empty;
    public string Karton
    {
        get { return karton; }
        set { karton = value; }
    }

    string config = string.Empty;
    public string Config
    {
        get { return config; }
        set { config = value; }
    }

    string minLength = string.Empty;
    public string MinLength
    {
        get { return minLength; }
        set { minLength = value; }
    }

    string maxLength = string.Empty;
    public string MaxLength
    {
        get { return maxLength; }
        set { maxLength = value; }
    }

    string minHeight = string.Empty;
    public string MinHeight
    {
        get { return minHeight; }
        set { minHeight = value; }
    }

    string maxHeight = string.Empty;
    public string MaxHeight
    {
        get { return maxHeight; }
        set { maxHeight = value; }
    }

    string minWidth = string.Empty;
    public string MinWidth
    {
        get { return minWidth; }
        set { minWidth = value; }
    }

    string maxWidth = string.Empty;
    public string MaxWidth
    {
        get { return maxWidth; }
        set { maxWidth = value; }
    }

    string typeLoad = string.Empty;
    public string TypeLoad
    {
        get { return typeLoad; }
        set { typeLoad = value; }
    }

    public List<Product> ListProduct
    {
        get
        {
            List<Product> lp = new List<Product>();
            List<Product> lpf = new List<Product>();
            int _catId = 0;
            double start = 0; 
            double end = 0;

            if (int.TryParse(this.CatId, out _catId))
            {
                lp = Schema.Products.Select("CategoryID = @1", new SelectOptions("OrderIndex", SortOrder.Ascending), _catId).Items;

                if (this.TypeLoad == "filter")
                {
                    foreach (Product p in lp)
                    {
                        bool found = true;
                        if (this.Karton != "Картон")
                            found = (p.KartonName.IndexOf(this.Karton) > -1);

                        if (found)
                        {
                            if (this.Config != "Конфигурация")
                                found = (p.ConfigName.IndexOf(this.Config) > -1);
                        }                                                

                        if (found)
                        {
                            if ((!string.IsNullOrEmpty(this.MinLength.Trim()) && double.TryParse(this.MinLength.Trim(), out start)) && (!string.IsNullOrEmpty(this.MaxLength.Trim()) && double.TryParse(this.MaxLength.Trim(), out end)))
                            {
                                found = (p.Length >= start) && (p.Length <= end);
                            }
                            else
                                if (!string.IsNullOrEmpty(this.MinLength.Trim()) && double.TryParse(this.MinLength.Trim(), out start))
                                {
                                    found = p.Length >= start;
                                }
                                else
                                    if (!string.IsNullOrEmpty(this.MaxLength.Trim()) && double.TryParse(this.MaxLength.Trim(), out end))
                                    {
                                        found = p.Length <= end;
                                    }
                        }

                        start = 0; end = 0;
                        if (found)
                        {
                            if ((!string.IsNullOrEmpty(this.MinHeight.Trim()) && double.TryParse(this.MinHeight.Trim(), out start)) && (!string.IsNullOrEmpty(this.MaxHeight.Trim()) && double.TryParse(this.MaxHeight.Trim(), out end)))
                            {
                                found = (p.Height >= start) && (p.Height <= end);
                            }
                            else
                                if (!string.IsNullOrEmpty(this.MinHeight.Trim()) && double.TryParse(this.MinHeight.Trim(), out start))
                                {
                                    found = p.Height >= start;
                                }
                                else
                                    if (!string.IsNullOrEmpty(this.MaxHeight.Trim()) && double.TryParse(this.MaxHeight.Trim(), out end))
                                    {
                                        found = p.Height <= end;
                                    }
                        }

                        start = 0; end = 0;
                        if (found)
                        {
                            if ((!string.IsNullOrEmpty(this.MinWidth.Trim()) && double.TryParse(this.MinWidth.Trim(), out start)) && (!string.IsNullOrEmpty(this.MaxWidth.Trim()) && double.TryParse(this.MaxWidth.Trim(), out end)))
                            {
                                found = (p.Width >= start) && (p.Width <= end);
                            }
                            else
                                if (!string.IsNullOrEmpty(this.MinWidth.Trim()) && double.TryParse(this.MinWidth.Trim(), out start))
                                {
                                    found = p.Width >= start;
                                }
                                else
                                    if (!string.IsNullOrEmpty(this.MaxWidth.Trim()) && double.TryParse(this.MaxWidth.Trim(), out end))
                                    {
                                        found = p.Width <= end;
                                    }
                        }

                        if (found) lpf.Add(p);
                    }
                }
                else if (this.TypeLoad == "reset")
                {
                    lpf = lp;
                }
            }
            
            return lpf;
        }
    }

}

class FilterResultsJson
{
    string currentPage = string.Empty;
    public string CurrentPage
    {
        get { return currentPage; }
        set { currentPage = value; }
    }

    string catId = string.Empty;
    public string CatId
    {
        get { return catId; }
        set { catId = value; }
    }

    string productsHtml = string.Empty;
    public string ProductsHtml
    {
        get { return productsHtml; }
        set { productsHtml = value; }
    }

    string yepNope = string.Empty;
    public string YepNope
    {
        get { return yepNope; }
        set { yepNope = value; }
    }
}