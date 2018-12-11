<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item.ascx.cs" Inherits="catalog_item" %>
<div class="filter-catalog">
    <div class="filter-item">
        <asp:DropDownList ID="ddlCat" runat="server">
            <asp:ListItem Text="Контейнеры" Value="Контейнеры"></asp:ListItem>
            <asp:ListItem Text="Контейнеры" Value="Контейнеры"></asp:ListItem>
            <asp:ListItem Text="Контейнеры" Value="Контейнеры"></asp:ListItem>
        </asp:DropDownList><asp:DropDownList CssClass="nbl" ID="ddlCatChild" runat="server">
            <asp:ListItem Text="Контейнеры для кондитерских изделий" Value="Контейнеры для кондитерских изделий"></asp:ListItem>
            <asp:ListItem Text="Контейнеры для кондитерских изделий" Value="Контейнеры для кондитерских изделий"></asp:ListItem>
            <asp:ListItem Text="Контейнеры для кондитерских изделий" Value="Контейнеры для кондитерских изделий"></asp:ListItem>
        </asp:DropDownList><input class="nbl" type="text"><a class="btn-send btn-find" href="#">Поиск</a>
    </div>
</div>

<div class="forwardcatalog"><a href="<%=AppPath %>/catalog/index.aspx">Назад к списку товаров</a></div>

<div class="prod-item-descr">
    <div class="row">
        <div class="col-md-5 text-left">
            <%--<img src="<%=AppPath %>/ii/prod-img.png" alt="" />--%>
            <asp:Literal ID="ltImgMain" EnableViewState="false" runat="server"></asp:Literal>
            <div class="row">
            <asp:Literal ID="ltImgExt" EnableViewState="false" runat="server"></asp:Literal>
                <%--<div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>
                <div class="col-md-2 img-prod-little">
                   <img src="<%=AppPath %>/ii/prod-img-little.png" alt="" />
                </div>--%>
            </div>
        </div>
        <div class="col-md-7">
            <div class="title-prod"><asp:Literal ID="ltName" EnableViewState="false" runat="server"></asp:Literal></div>
            <div class="manufact-prod"></div>
            <div class="code-prod">Код: <asp:Literal ID="ltCode" EnableViewState="false" runat="server"></asp:Literal></div>
            <div class="descr-prod"><asp:Literal ID="ltDescr" EnableViewState="false" runat="server"></asp:Literal></div>
            <div class="cart-add-prod"><a href="#"><img src="<%=AppPath %>/ii/add-cart-prod.png" alt="Добавить в корзину" /></a></div>
        </div>
        </div>
</div>

<div class="title-contant prod-title-contant">Вам также могут быть интересны</div>

<div class="wrapper-catalog">
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="catalog-item">
           <div class="catalog-img"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/prod-item.png" alt="" /></a></div>
           <div class="catalog-name"><a href="<%=AppPath %>/catalog/item.aspx">Трехслойная стирательная резинка</a></div>
           <div class="catalog-manufact">Brauberg</div>
           <div class="catalog-add"><a href="<%=AppPath %>/catalog/item.aspx"><img src="<%=AppPath %>/ii/add-cart.png" alt="" /></a>
            <div class="star"><a href="#"><img src="<%=AppPath %>/ii/star.png" alt="" /></a></div>
           </div>
        </div>
    </div>            
    <div class="clearfix"></div> 
    <br />      
</div>