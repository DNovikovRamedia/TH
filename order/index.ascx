<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="order_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<p>Описание процесса заказа на сайте</p>
<h2 class="marginless">Полный каталог продукции</h2>
<iwc:xsltlistview runat="server" id="xpvChildCategory" stylesheetlocation="~/xsl/childCats.xsl" />