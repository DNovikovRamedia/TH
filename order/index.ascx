<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="order_index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

<p>�������� �������� ������ �� �����</p>
<h2 class="marginless">������ ������� ���������</h2>
<iwc:xsltlistview runat="server" id="xpvChildCategory" stylesheetlocation="~/xsl/childCats.xsl" />