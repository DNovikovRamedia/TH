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

[AdminWintrol("EF488E8B-0C6A-4283-3856-D46522871213", typeof(MuAdminGroup), "Картон", "Список типов картона", AdminWintrolState.Hidden)]
public class KartonManager : ListEditorWintrol<int, Karton>
{
    public KartonManager()
    {
        this.Init += new EventHandler(KartonManager_Init);
    }

    void KartonManager_Init(object sender, EventArgs e)
    {
        UpdateList();
    }

    protected override void UpdateList()
    {
        this.List = Schema.Kartons.SelectAll();
    }
}