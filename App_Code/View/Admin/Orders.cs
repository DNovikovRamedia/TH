using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Schema;
using Ideal.Commerce.Admin;
using Ideal.Wision;
using Ideal.Commerce;
using Ktk.Model;

[AdminWintrol("2B50D62A-0E72-4a97-8EFE-7886BDFF83B5", typeof(MuAdminGroup), "Список заказов", "Управление заказами", AdminWintrolState.Hidden, "~/ii/ai/orders.gif")]
    public sealed class Orders : OrderList
    {
        public Orders()
            : base(Commerce.Engine)
        {
            this.Init += new EventHandler(Orders_Init);
            this.Load += new EventHandler(Orders_Load);
        }

        void Orders_Init(object sender, EventArgs e)
        {
            UpdateList();
        }

        void Orders_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            UpdateList();
        }

        protected override string[] CustomOrderEndHeaders
        {
            get
            {
                return new string[] { " ", "Артикул" };
            }
        }

        protected override string[] GetCustomOrderEndColumnData(OrderItem orderItem)
        {
            Product product = (Product)orderItem.Product;
            return new string[] { product.Articul };
        }
    }