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
using Ideal.Core.Reflection.Validators;

namespace Ktk.Model
{
    [RelationBackendName("Config"), CacheMode(RelationCacheMode.Super)]
    public class Config : Entity<int, Config>
    {
        #region DAL

        [Member("ID"), UiTitle("ID"), MemberIndex(1), AutoIncrement, PrimaryKey, UiLocation(Location.None)]
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        [Member("Active"), UiTitle("Активен"), UiLocation(Location.Both)]
        public bool Active = true;

        [Member("Name"), MaximumLength(128), MinimumStringLength(2), UiTitle("Название"), UiLocation(Location.Both), DefaultSort]
        public string Name = string.Empty;

        [EntityMember]
        public DateTime DateCreated;

        [EntityMember]
        public Guid CreatedBy;

        #endregion

        protected override void AfterCreation()
        {
            base.AfterCreation();

            this.DateCreated = DateTime.Now;
            this.CreatedBy = Manager.CurrentPersonGuid;
        }

        public static List<Config> ActiveList
        {
            get
            {
                return Schema.Configs.Select("Active = @1", new SelectOptions("Name", SortOrder.Descending), true).Items;
            }
        }
    }
}