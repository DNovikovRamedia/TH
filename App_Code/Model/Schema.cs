using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Entity;
using Ideal.Wision.Core;

namespace Ktk.Model
{
    [RelationBackendNamePrefix("inv")]
    public sealed class Schema : RelationalSchema
    {
        Relation<int, Product> products;
        public static Relation<int, Product> Products
        {
            get { return Instance.products; }
        }

        Relation<int, ProductCategory> categories;
        public static Relation<int, ProductCategory> Categories
        {
            get { return Instance.categories; }
        }

        Relation<int, Karton> kartons;
        public static Relation<int, Karton> Kartons
        {
            get { return Instance.kartons; }
        }

        Relation<int, Config> configs;
        public static Relation<int, Config> Configs
        {
            get { return Instance.configs; }
        }

        Relation<int, Ad> ads;
        public static Relation<int, Ad> Ads
        {
            get { return Instance.ads; }
        }

        static Schema instance = null;
        static Schema Instance
        {
            get
            {
                if (null == instance)
                    instance = new Schema(WisionApplication.DefaultBackendAdapter);
                return instance;
            }
        }

        static Schema()
        {
            if (null == instance)
                instance = new Schema(WisionApplication.DefaultBackendAdapter);
        }

        public Schema(Adapter adapter)
            : base(adapter)
        { }

        public override List<EntityProperties> CreateRelations()
        {
            products = new Relation<int, Product>(adapter, this);
            categories = new Relation<int, ProductCategory>(adapter, this);
            kartons = new Relation<int, Karton>(adapter, this);
            configs = new Relation<int, Config>(adapter, this);
            ads = new Relation<int, Ad>(adapter, this);
            
            List<EntityProperties> lp = new List<EntityProperties>();
            lp.Add(products.EntityProperties);
            lp.Add(categories.EntityProperties);
            lp.Add(kartons.EntityProperties);
            lp.Add(configs.EntityProperties);
            lp.Add(ads.EntityProperties);
            
            return lp;
        }

        internal static void Ping()
        {
            ;
        }
    }
}