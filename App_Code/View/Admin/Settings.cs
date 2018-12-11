using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision.Schema.Admin;
using System.Web.UI.WebControls;
using Ideal.Wision.Schema;
using System.Web.UI.HtmlControls;
using Ideal.Wision;
using System.Text.RegularExpressions;
using Ktk.Model;


[AdminWintrol("{EF488E8B-0C6A-4283-85EE-D46538EE988B}", typeof(MuAdminGroup), "Настройки сайта", "Управление настройками сайта")]
public class Settings : Wintrol
{
    Button btnSave = null;
    FileUpload fuBanner1 = new FileUpload();
    TextBox tbBannerLink1 = null;
    FileUpload fuBanner2 = new FileUpload();
    TextBox tbBannerLink2 = null;
    TextBox tbOrderEmail = null;

    public Settings()
    {
        this.Init += new EventHandler(Settings_Init);
    }

    void Settings_Init(object sender, EventArgs e)
    {
        this.ID = "Settings";        

        tbOrderEmail = new TextBox();
        tbOrderEmail.ID = "tbOE";
        tbOrderEmail.EnableViewState = false;
        tbOrderEmail.Width = Unit.Pixel(300);
        tbOrderEmail.Text = Variables.OrderEmail;

        HtmlTable table = new HtmlTable();

        HtmlTableRow row = new HtmlTableRow();
        HtmlTableCell cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Email для заказов";
        row.Cells.Add(cell);

        cell = new HtmlTableCell();
        cell.Controls.Add(tbOrderEmail);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        btnSave = new Button();
        btnSave.Text = "Сохранить";
        btnSave.Click += new EventHandler(btnSave_Click);
        
        tbBannerLink1 = new TextBox();
        tbBannerLink1.ID = "tbBL1";
        tbBannerLink1.EnableViewState = false;
        tbBannerLink1.Width = Unit.Pixel(300);
        tbBannerLink1.Text = Variables.BannerLink1;

        fuBanner1 = new FileUpload();
        fuBanner1.ID = "fuBanner1";

        tbBannerLink2 = new TextBox();
        tbBannerLink2.ID = "tbBL2";
        tbBannerLink2.EnableViewState = false;
        tbBannerLink2.Width = Unit.Pixel(300);
        tbBannerLink2.Text = Variables.BannerLink2;

        fuBanner2 = new FileUpload();
        fuBanner2.ID = "fuBanner2";

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Ссылка на баннер №1";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbBannerLink1);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Баннер №1";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(fuBanner1);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Ссылка на баннер №2";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(tbBannerLink2);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        row = new HtmlTableRow();
        cell = new HtmlTableCell();
        row.Style.Add(System.Web.UI.HtmlTextWriterStyle.Width, "300px");
        cell = new HtmlTableCell();
        cell.InnerText = "Баннер №2";
        row.Cells.Add(cell);
        cell = new HtmlTableCell();
        cell.Controls.Add(fuBanner2);
        row.Cells.Add(cell);
        table.Rows.Add(row);

        this.Controls.Add(table);
        this.Controls.Add(btnSave);
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        Variables.BannerLink1 = tbBannerLink1.Text;
        if (!string.IsNullOrEmpty(fuBanner1.FileName))
        {
            fuBanner1.SaveAs(Env.Server.MapPath("~/ii/banner1.jpg"));
        }
        Variables.BannerLink2 = tbBannerLink2.Text;
        if (!string.IsNullOrEmpty(fuBanner2.FileName))
        {
            fuBanner2.SaveAs(Env.Server.MapPath("~/ii/banner2.jpg"));
        }

        Variables.OrderEmail = tbOrderEmail.Text.Trim();

        Env.RegisterStartupMessage("settingsWasSaved", "Настройки успешно сохранены.");
    }
}