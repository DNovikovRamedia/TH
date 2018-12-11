<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cart.ascx.cs" Inherits="catalog_cart" %>

<asp:Panel ID="pnlItems" runat="server" DefaultButton="btnUpdate">
<asp:Literal ID="ltCart" runat="server" EnableViewState="false" />
<br />
����� ������ ������� � ���� �������� ��� �������� � �� ������� �������� ��� ������ ������.
<br /><br />
<asp:Button ID="btnUpdate" runat="server" Text="�����������" CssClass="btn-green" OnClick="btnUpdate_Click" ToolTip="������� ����� ��������� � ������������ �� ��������� ���� �����������" />
&nbsp;&nbsp;
<asp:Button ID="btnClean" runat="server" Text="��������" CssClass="btn-green" OnClick="btnClean_Click" ToolTip="�� ������� ����� ������� ��� ������" />
&nbsp;&nbsp;
<asp:Button ID="btnOrder" runat="server" Text="��������" CssClass="btn-green" Font-Bold="true" OnClick="btnOrder_Click" ToolTip="������������ ����� � ������������ � ������� ��������" />
</asp:Panel>

<asp:Panel ID="pnlNoItems" runat="server">
    ���� ������� �����
</asp:Panel>

<asp:Panel ID="pnlDetails" runat="server" Visible="false" DefaultButton="btnOrderIt">


<table cellpadding="3" cellspacing="0" border="0" class="services services-order form-send">
    <tr>
        <td width="300px">
            �������� �����������:
        </td>
        <td width="150px">
            <asp:TextBox ID="tbNameOrg" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            ���������� ����:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbFIO" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tbFIO" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            ���������� �������:
        </td>
        <td>
            <asp:TextBox ID="tbPhone" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>            
        </td>
    </tr>
        <tr>
        <td width="300px">
            ����������� �����:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbMail" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="tbMail" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr> 
    <tr>
        <td width="300px">
            ���������� ������ ������:
        </td>
        <td>
            <asp:TextBox ID="tbColor" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>            
        </td>
    </tr>
        <tr>
        <td width="300px">
            �����:<sup style="color:Red;">*</sup>
        </td>
        <td width="150px">
            <asp:TextBox ID="tbCount" CssClass="form-control-cart" runat="server" BorderWidth="1px" Width="250px"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tbCount" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>   
    <tr>
        <td colspan="3">
        <sup style="color:Red;">*</sup> - <span style="font-size:8.5pt;">����, ������������ ��� ����������.</span>
        </td>
    </tr>
</table>

    <b>����������� (���� ��� ��������� ������ ��������, ���� ��������� � �������):</b>    
    <p>
        <asp:TextBox ID="tbRemarks" CssClass="form-control" runat="server" Width="560px" TextMode="MultiLine" Rows="7" />
    </p>
    <p>
        <asp:Button ID="btnOrderIt" runat="server" Text="������� �����" Font-Bold="true" OnClick="btnOrderIt_Click" ToolTip="������������ ����� � ������������ � ������� ��������" CssClass="btn-green" />
    </p>
</asp:Panel>
<asp:Panel ID="pnlCheckout" runat="server" Visible="false">
    <p>������� �� ��� �����<%-- �
    <asp:Label ID="labOrder" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="Label"></asp:Label>--%>!
    </p>
    <p>
        ��� �������� �������� � ���� � ��������� �����, ����� �������� ������� �� ������ ������ � ���������� ����������� ������ ��� ����������.</p>
<%-- <script type="text/javascript" >
 setTimeout('location.replace("index.aspx")', 5000);
</script>--%>
</asp:Panel>
