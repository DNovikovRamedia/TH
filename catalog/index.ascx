<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="catalog_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<asp:PlaceHolder ID="phMainDescrCat" EnableViewState="false" Visible="false" runat="server">
    <iwc:contentbox id="cbMainDescrCat" runat="server" code="MainDescrCat" />
</asp:PlaceHolder>

<asp:Literal ID="ltDescrCat" EnableViewState="false" runat="server"></asp:Literal>

<asp:PlaceHolder ID="phFilter" EnableViewState="false" Visible="false" runat="server">
<div class="filter-prod">
<div class="filter-title">������ �������</div>
<div class="filter-catalog">
    <div class="filter-item">
        <b>����������� ��:</b>
        <asp:DropDownList ID="ddlKart" CssClass="nblinput" runat="server">
            <asp:ListItem Text="������" Value="������"></asp:ListItem>            
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:DropDownList ID="ddlConf" CssClass="nblinput" runat="server">
            <asp:ListItem Text="������������" Value="������������"></asp:ListItem>            
        </asp:DropDownList>        
    </div>    
    <div class="filter-item">
        <b>�����:</b> �� <asp:TextBox ID="tbLengthMin" CssClass="nbl" runat="server"></asp:TextBox> �� <asp:TextBox ID="tbLengthMax" CssClass="nbl" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <b>������:</b> ��  <asp:TextBox ID="tbHeightMin" CssClass="nbl" runat="server"></asp:TextBox> �� <asp:TextBox ID="tbHeightMax" CssClass="nbl" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <b>������:</b> �� <asp:TextBox ID="tbWidthMin" CssClass="nbl" runat="server"></asp:TextBox> �� <asp:TextBox ID="tbWidthMax" CssClass="nbl" runat="server"></asp:TextBox>
        &nbsp;&nbsp;<span id="fltrSet" class="btn-filter">���������</span>&nbsp;&nbsp;<span id="fltrReset" class="btn-filter">�����</span>
    </div>
</div>
</div>
<asp:HiddenField ID="hfCatid" runat="server" />
</asp:PlaceHolder>

<iwc:xsltlistview runat="server" id="xpvChildCategory" stylesheetlocation="~/xsl/childCats.xsl" />
<iwc:xsltlistview  runat="server" id="xpvProducts" stylesheetlocation="~/xsl/catalog.xsl" />