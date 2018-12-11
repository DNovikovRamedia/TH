<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cart.ascx.cs" Inherits="catalog_cart" %>

<asp:Panel ID="pnlItems" runat="server" DefaultButton="btnUpdate">
<asp:Literal ID="ltCart" runat="server" EnableViewState="false" />
<br />
После заказа товаров с Вами свяжется наш менеджер и Вы сможете уточнить все детали заказа.
<br /><br />
<asp:Button ID="btnUpdate" runat="server" Text="Пересчитать" CssClass="btn-green" OnClick="btnUpdate_Click" ToolTip="Корзина будет обновлена в соответствии со внесёнными Вами изменениями" />
&nbsp;&nbsp;
<asp:Button ID="btnClean" runat="server" Text="Очистить" CssClass="btn-green" OnClick="btnClean_Click" ToolTip="Из корзины будут удалены все товары" />
&nbsp;&nbsp;
<asp:Button ID="btnOrder" runat="server" Text="Заказать" CssClass="btn-green" Font-Bold="true" OnClick="btnOrder_Click" ToolTip="Сформировать заказ в соответствии с текущей корзиной" />
</asp:Panel>

<asp:Panel ID="pnlNoItems" runat="server">
    Ваша корзина пуста
</asp:Panel>

<asp:Panel ID="pnlDetails" runat="server" Visible="false" DefaultButton="btnOrderIt">


<table cellpadding="3" cellspacing="0" border="0" class="services services-order form-send">
    <tr>
        <td width="300px">
            Название организации:
        </td>
        <td width="150px">
            <asp:TextBox ID="tbNameOrg" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            Контактное лицо:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbFIO" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbFIO" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            Контактный телефон:
        </td>
        <td>
            <asp:TextBox ID="tbPhone" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>            
        </td>
    </tr>
        <tr>
        <td width="300px">
            Электронная почта:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbMail" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbMail" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            Количество цветов печати:
        </td>
        <td>
            <asp:TextBox ID="tbColor" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>            
        </td>
    </tr>
        <tr>
        <td width="300px">
            Тираж:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbCount" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tbCount" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>   
    <tr>
        <td colspan="3">
        <sup style="color:Red;">*</sup> - <span style="font-size:8.5pt;">поля, обязательные для заполнения.</span>
        </td>
    </tr>
</table>

    <b>Комментарий (поле для уточнения сроков доставки, ваши пожелания и вопросы):</b>    
    <p>
        <asp:TextBox ID="tbRemarks" CssClass="form-control" runat="server" Width="560px" TextMode="MultiLine" Rows="7" />
    </p>
    <p>
        <asp:Button ID="btnOrderIt" runat="server" Text="Сделать заказ" Font-Bold="true" OnClick="btnOrderIt_Click" ToolTip="Сформировать заказ в соответствии с текущей корзиной" CssClass="btn-green" />
    </p>
</asp:Panel>
<asp:Panel ID="pnlCheckout" runat="server" Visible="false">
    <p>Спасибо за Ваш заказ<%-- №
    <asp:Label ID="labOrder" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="Label"></asp:Label>--%>!
    </p>
    <p>
        Наш менеджер свяжется с Вами в ближайшее время, чтобы уточнить вопросы по Вашему заказу и предложить оптимальный способ его выполнения.</p>
<%-- <script type="text/javascript" >
 setTimeout('location.replace("index.aspx")', 5000);
</script>--%>
</asp:Panel>
