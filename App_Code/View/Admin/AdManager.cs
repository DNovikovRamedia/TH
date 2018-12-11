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
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using Ktk.Model;

[AdminWintrol("EF488E8B-0C6A-4283-85EE-D46538111555", typeof(MuAdminGroup), "Слайдер", "Управление изображениями в слайдере на главной странице сайта")]
public class AdManager : ListEditorWintrol<int, Ad>
{

    public AdManager()
    {
        this.Init += new EventHandler(AdManager_Init);
    }

    void AdManager_Init(object sender, EventArgs e)
    {
        UpdateList();
    }

    protected override void UpdateList()
    {
        base.UpdateList();
        this.List = Schema.Ads.SelectAll();
    }

    protected override string GetEditorTitle()
    {
        return IsEditableEntityIsNew
            ? "Добавить новый баннер"
            : CurrentEditableInstance.Name;
    }

    protected override string GetListTitle()
    {
        return "Управление баннерами на главной";
    }


    protected override void AssignEditorTitle()
    {
        EditorTitle = IsEditableEntityIsNew
            ? "Добавить новый баннер"
            : CurrentEditableInstance.Name;
    }
}