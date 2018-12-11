using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using Ideal.Wision.Schema;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using DynaControlslLibrary;
using System.Web.UI;
using Ideal.UI.Web;
using Ideal.Wision.Controls;
using Ideal.Entity;
using Ktk.Model;

[AdminWintrol("EF488E8B-0C6A-4283-3856-D46522871255", typeof(MuAdminGroup), "Конфигурация", "Список конфигураций", AdminWintrolState.Hidden)]
    public class ConfigManager : ListEditorWintrol<int, Config>
    {
        public ConfigManager()
        {
            this.Init += new EventHandler(ConfigManager_Init);
        }

        void ConfigManager_Init(object sender, EventArgs e)
        {
            UpdateList();
        }

        protected override void UpdateList()
        {
            this.List = Schema.Configs.SelectAll();
        }
    }