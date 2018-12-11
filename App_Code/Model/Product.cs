using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Entity;
using Ideal.UI;
using Ideal.Core.Xml;
using Ideal.UI.Builders;
using Ideal.Core.Imaging;
using Ideal.Wision.Schema;
using Ideal.Wision;
using Ideal.Commerce;
using System.Xml;
using System.IO;
using System.Drawing;
using Ideal.Core;
using System.Web.UI.WebControls;
using System.Globalization;
using Ideal.Wision.IO;
using Ideal.Wision.Identity;
using Ideal.Core.Net;

namespace Ktk.Model
{
    [RelationBackendName("Products"), CacheMode(RelationCacheMode.Super)]
    public class Product : Entity<int, Product>, IProduct, IComplexProduct
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        internal int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member("GID"), UiTitle("GID"), UiLocation(Location.None)]
        Guid gid;
        public Guid GID
        {
            get { return gid; }
            set { gid = value; }
        }

        [Member, UiLocation(Location.None), XmlCustomFormat("{0:d}")]
        protected DateTime dateCreated = DateTime.Now;
        public DateTime DateCreated
        {
            get { return this.dateCreated; }
        }

        [Member("Articul"), MaximumLength(64), UiTitle("Артикул"), UiLocation(Location.AbsolutelyNone), UiCustomFormat("{0:d2}")]
        internal string articul = String.Empty;
        public string Articul
        {
            get { return articul; }
            set { articul = value; }
        }

        [Member("NewProd"), UiTitle("Новинка"), UiLocation(Location.Both)]
        protected bool newProd = false;
        public bool NewProd
        {
            get { return newProd; }
            set { newProd = value; }
        }

        [Member("Name"), MaximumLength(128), UiTitle("Название"), UiLocation(Location.Both)]
        string name = String.Empty;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        //[Member("About"), MaximumLength(1024), UiTitle("Краткое описание"), UiLocation(Location.Editor)]
        //string about = String.Empty;
        //public string About
        //{
        //    get { return about; }
        //    set { about = value; }
        //}

        [Member("Weight"), UiTitle("Вес"), UiLocation(Location.AbsolutelyNone)]
        protected double weight = 0;
        public double Weight
        {
            get { return weight; }
            set { weight = value; }
        }

        [Member, UiLocation(Location.None)]
        public int OrderIndex;

        [EntityMember("Price"), UiMember("BasePrice"), XmlMember, UiTitle("Розничная цена"), UiLocation(Location.AbsolutelyNone)]
        internal double basePrice = 0;
        public double BasePrice
        {
            get { return basePrice; }
            set { basePrice = value; }
        }

        [Member("Count"), UiTitle("Количество, шт."), UiLocation(Location.AbsolutelyNone)]
        int count = 0;
        public int Count
        {
            get { return count; }
            set { count = value; }
        }

        [Member("Length"), UiTitle("Длина"), UiLocation(Location.Both)]
        protected double length = 0;
        public double Length
        {
            get { return length; }
            set { length = value; }
        }

        [Member("Width"), UiTitle("Ширина"), UiLocation(Location.Both)]
        protected double width = 0;
        public double Width
        {
            get { return width; }
            set { width = value; }
        }

        [Member("Height"), UiTitle("Высота"), UiLocation(Location.Both)]
        protected double height = 0;
        public double Height
        {
            get { return height; }
            set { height = value; }
        }


        [Member("KartonID"), UiTitle("Картон"), Indexed, UiCustomBuilder(typeof(KartonBuilder))]
        protected int kartonID;
        public int KartonID
        {
            get { return kartonID; }
            set
            {
                if (kartonID != value)
                    this.RebuildIndex(IxKrnID, kartonID, value);
                kartonID = value;
            }
        }

        static int ixKrnID = -1;
        static int IxKrnID
        {
            get
            {
                if (ixKrnID == -1)
                    ixKrnID = Schema.Products.Cache.GetIndexNumber("KartonID");
                return ixKrnID;
            }
        }

        public Karton Karton
        {
            get
            {
                return Schema.Kartons[this.kartonID];
            }
        }

        [XmlMember]
        public string KartonName
        {
            get
            {
                if (this.kartonID == 0)
                    return string.Empty;
                return Karton.Name;
            }
        }

        [Member("ConfigID"), UiTitle("Конфигурация"), Indexed, UiCustomBuilder(typeof(ConfigBuilder))]
        protected int configID;
        public int ConfigID
        {
            get { return configID; }
            set
            {
                if (configID != value)
                    this.RebuildIndex(IxCnfID, configID, value);
                configID = value;
            }
        }

        static int ixCnfID = -1;
        static int IxCnfID
        {
            get
            {
                if (ixCnfID == -1)
                    ixCnfID = Schema.Products.Cache.GetIndexNumber("ConfigID");
                return ixCnfID;
            }
        }

        public Config Config
        {
            get
            {
                return Schema.Configs[this.configID];
            }
        }

        [XmlMember]
        public string ConfigName
        {
            get
            {
                if (this.configID == 0)
                    return string.Empty;
                return Config.Name;
            }
        }

        public static List<string> ListKartonByProductCategory(List<Product> lps)
        {            
                List<string> ls = new List<string>();
                foreach (Product prod in lps)
                {
                    if ( !ls.Contains(prod.KartonName) )
                        ls.Add(prod.KartonName);
                }
               
               return ls;
        }

        public static List<string> LengthMinMaxByProductCategory(List<Product> lps)
        {
            List<string> ls = new List<string>();
            double min = 10000;
            double max = 0;
            foreach (Product prod in lps)
            {
                if (prod.Length < min)
                    min = prod.Length;
                if (prod.Length > max)
                    max = prod.Length;
            }
            ls.Add(min.ToString());
            ls.Add(max.ToString());

            return ls;
        }

        public static List<string> HeightMinMaxByProductCategory(List<Product> lps)
        {
            List<string> ls = new List<string>();
            double min = 10000;
            double max = 0;
            foreach (Product prod in lps)
            {
                if (prod.Height < min)
                    min = prod.Height;
                if (prod.Height > max)
                    max = prod.Height;
            }
            ls.Add(min.ToString());
            ls.Add(max.ToString());

            return ls;
        }

        public static List<string> WidthMinMaxByProductCategory(List<Product> lps)
        {
            List<string> ls = new List<string>();
            double min = 10000;
            double max = 0;
            foreach (Product prod in lps)
            {
                if (prod.Width < min)
                    min = prod.Width;
                if (prod.Width > max)
                    max = prod.Width;
            }
            ls.Add(min.ToString());
            ls.Add(max.ToString());

            return ls;
        }

        public static List<string> ListConfigByProductCategory(List<Product> lps)
        {
            List<string> ls = new List<string>();
            foreach (Product prod in lps)
            {
                if (!ls.Contains(prod.ConfigName))
                    ls.Add(prod.ConfigName);
            }

            return ls;
        }

        [XmlMember]
        public bool IsNew
        {
            get
            {
                return this.dateCreated > DateTime.Now.AddDays(-30);
            }
        }

        //[Member, UiTitle("Гарнитуры"), MaximumLength(256)]
        //public string Garnitures = string.Empty;

        //[Member("Enabled"), UiTitle("Наличие на складе"), UiLocation(Location.List)]
        //bool enabled = true;
        //public bool Enabled
        //{
        //    get { return enabled; }
        //    set { enabled = value; }
        //}

        [Member("CategoryID"), UiTitle("Категория"), UiLocation(Location.None), XmlCustomFormat("{0:d}"), Indexed]
        protected int categoryID;
        public int CategoryID
        {
            get { return categoryID; }
            set
            {
                if (categoryID != value)
                    this.RebuildIndex(IxCatID, categoryID, value);
                categoryID = value;
            }
        }

        static int ixCatID = -1;
        static int IxCatID
        {
            get
            {
                if (ixCatID == -1)
                    ixCatID = Schema.Products.Cache.GetIndexNumber("CategoryID");
                return ixCatID;
            }
        }

        /*[Member, UiTitle("Вставки"), MaximumLength(512)]
        public string Insertions = string.Empty;

        [Member, UiTitle("Металлы"), MaximumLength(512)]
        public string Metals = string.Empty;

        [Member, UiTitle("Проба")]
        public int Probe;*/

        [Member("Description", typeof(EntityProperties), typeof(XmlProperties)), MaximumLength(1048576)]
        protected string description = String.Empty;
        [UiMember("Description"), UiTitle("Описание"), UiLocation(Location.Editor)]
        public HtmlText Description
        {
            get { return new HtmlText(description); }
            set { description = value.Html; }
        }

        //[Member]
        //public bool HasImage = false;

        [EntityMember("Photo"), MaximumLength(1024)]
        protected string photo = string.Empty;
        [UiMember, UiTitle("Фото"), ImageLocation("~/i/p/"), ImagePreview(220, 220), XmlMember]
        public ImageInfo Photo
        {
            get { return new ImageInfo(this.photo); }
            set { this.photo = value.State; }
        }

        [EntityMember("Photos"), MaximumLength(8192)]
        protected string photos = string.Empty;
        [UiMember, UiTitle("Доп. фотографии"), ImageLocation("~/i/p/"), ImagePreview(-244), XmlMember]
        public ImagesInfo Photos
        {
            get { return new ImagesInfo(this.photos); }
            set { this.photos = value.State; }
        }

        [Member(typeof(XmlProperties))]
        public string ImageUrl
        {
            get
            {
                if (this.Photo.Exists)
                    return String.Format(@"{0}/i/p/{1}", Env.AppPath, this.Photo.LargeName);

                return String.Format("{0}/ii/t.gif", Env.AppPath);
            }
        }

        [Member(typeof(XmlProperties))]
        public string PreviewUrl
        {
            get
            {
                //if (!this.HasImage)
                //    return string.Empty;

                if (this.Photo.PreviewName != String.Empty)
                    return String.Format(@"{0}/i/p/{1}", Env.AppPath, this.Photo.PreviewName);
                else                
                    return String.Format("{0}/ii/no-image.jpg", Env.AppPath);   
            }
        }

        #endregion

        [UiMember("CutColumn"), UiTitle("&nbsp;"), UiLocation(Location.List), MemberIndex(1000)]
        public string CutColumn
        {
            get
            {
                return String.Format("<div style='text-align: center'><input id='cb_{0}' type='checkbox' class='checkbox' /></div>", this.ID.ToString());
            }
        }

        #region XML

        [Member(typeof(XmlProperties))]
        public string UrlPath
        {
            get
            {
                return String.Format("{0}/catalog/{1}/{2}.aspx", Env.AppPath, this.CategoryID, this.ID);
            }
        }

        [UiMember, UiLocation(Location.List), UiTitle("Двиг")]
        public string MoveLink
        {
            get
            {
                return String.Format("<a href='AA4C6E16-6722-4ae3-A96B-803D4664F531.aspx?pid={0}' target='_blank'>...</a>", this.ID);
            }
        }

        public double Price
        {
            get
            {
                //return 0;
                return this.BasePrice;
            }
        }

        /*[XmlMember]
        public string PriceString
        {
            get
            {
                string str = String.Empty;

                int k = (int)(this.Price / 1000);
                if (k > 0)
                    str = k.ToString() + ".";
                if (this.Price - k * 1000 != 0)
                    str += (this.Price - k * 1000).ToString() + " руб.";
                else
                    str += "000 руб.";

                return str;
            }
        }*/        

        #endregion

        /*static int ixVNum = -1;
        static int IxVNum
        {
            get
            {
                if (ixVNum == -1)
                    ixVNum = Schema.Products.Cache.GetIndexNumber("IsNew");
                return ixVNum;
            }
        }*/

        public ProductCategory Category
        {
            get { return Schema.Categories[this.CategoryID]; }
        }

        public string CategoryName
        {
            get
            {
                if (this.Category != null)
                    return Category.Name;

                return String.Empty;
            }
        }

        public static EntityList<int, Product> NewProducts
        {
            get
            {
                return Schema.Products.Select("IsNew = @1", true);
            }
        }

        public static EntityList<int, Product> LatestProducts
        {
            get
            {
                SelectOptions so = new SelectOptions("DateCreated", SortOrder.Descending);
                so.LastItem = 4;
                return Schema.Products.SelectAll(so);
            }
        }

        public static Product GetProductByArticle(string article)
        {
            //return Schema.Products.SelectSingle("Articul = @1", article);
            foreach (Product p in Schema.Products.Cache.CachedEntities)
            {
                if (p.Articul == article)
                    return p;
            }
            return null;
        }

        public bool IsInBranch(int catID)
        {
            if (catID == 0)
                return true;
            if (catID == this.CategoryID)
                return true;

            ProductCategory currentCat = this.Category;
            if (currentCat.ParentCategoryID != 0)
                while (currentCat.ID > 0)
                {
                    currentCat = currentCat.ParentCategory;
                    if (currentCat.ID == catID)
                        return true;
                }

            return false;
        }

        bool _isJustCreated = false;
        protected override void BeforeInsert()
        {
            int moi = 0;
            if (this.Category != null)
            {
                foreach (Product p in this.Category.Products)
                    if (p.OrderIndex > moi)
                        moi = p.OrderIndex;
                this.OrderIndex = moi + 1;
            }

            this.gid = Guid.NewGuid();
            this.dateCreated = DateTime.Now;
            //if (this.Photo.LargeName != String.Empty)
            //    this.HasImage = true;
            base.BeforeInsert();

            _isJustCreated = this.IsJustCreated;
        }

        #region IProduct Members

        public ProductAttributes Attributes
        {
            get { return null; }
        }

        public string Attrs
        {
            get
            {
                return this.CategoryID.ToString();
            }
            set
            {
                Attrs = value;
            }
        }

        public string BrandName
        {
            get { return String.Empty; }
        }

        public string Code
        {
            get { return this.Articul; }
        }

        public static Product GetByArt(string art)
        {
            foreach (Product p in Schema.Products.Cache.CachedEntities)
            {
                if (p.articul.Equals(art, StringComparison.CurrentCultureIgnoreCase))
                    return p;
            }

            return null;
        }

        Guid IProduct.ID
        {
            get { return this.GID; }
        }

        public double ListingPrice
        {
            //get { return this.Price; }
            get { return this.BasePrice; }
            //get { return 0; }
        }

        double IProduct.Price
        {
            get { return this.BasePrice; }
            //get { return 0; }
        }

        public string Title
        {
            get { return this.Articul; }
        }

        #endregion


        #region IComplexProduct Members

        string IComplexProduct.Code(SpecificItem ci)
        {
            return this.articul;
        }

        double IComplexProduct.ListingPrice(SpecificItem ci)
        {
            //return GetComplexPrice(ci);
            return this.BasePrice;
            //return 0;
        }

        double IComplexProduct.Price(SpecificItem ci)
        {
            //return GetComplexPrice(ci);
            return this.BasePrice;
            //return 0;
        }

        string IComplexProduct.Title(SpecificItem ci)
        {
            return this.name;
        }

        #endregion

        public ProductCategory RootCategory
        {
            get
            {
                ProductCategory pc = new ProductCategory();
                pc = this.Category;
                while (pc.ParentCategory != null)
                {
                    pc = pc.ParentCategory;
                }

                return pc;
            }
        }

        public ProductCategory ParentCategory
        {
            get
            {
                ProductCategory pc = new ProductCategory();
                pc = this.Category;
                //pc = this.Category.ParentCategory;            
                return pc;
            }
        }

    }

    public sealed class InsertionsInfo
    {
        public string insertions;
        public double price;
    }
    public sealed class SizeInfo
    {
        public double size;
        public double price;
    }
    public sealed class MetalsInfo
    {
        public string metals;
        public double price;
    }



    sealed class KartonBuilder : ExternalListBuilder<Karton>
    {
        protected override ExternalListBuilderType BuilderItemType
        {
            get { return ExternalListBuilderType.Int32; }
        }

        protected override IEnumerable<Karton> GetExternalList()
        {
            return Karton.ActiveList;
        }

        protected override object GetListItemText(Karton instance)
        {
            return instance.Name;
        }

        protected override object GetListItemValue(Karton instance)
        {
            return instance.ID;
        }
    }

    sealed class ConfigBuilder : ExternalListBuilder<Config>
    {
        protected override ExternalListBuilderType BuilderItemType
        {
            get { return ExternalListBuilderType.Int32; }
        }

        protected override IEnumerable<Config> GetExternalList()
        {
            return Config.ActiveList;
        }

        protected override object GetListItemText(Config instance)
        {
            return instance.Name;
        }

        protected override object GetListItemValue(Config instance)
        {
            return instance.ID;
        }
    }

}