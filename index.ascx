<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="index" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:PlaceHolder ID="phIndex" EnableViewState="false" Visible="false" runat="server">             
                    <div class="slider single-item">
                        <asp:Literal ID="ltSlider" EnableViewState="false" runat="server"></asp:Literal>          
                    </div>
                </asp:PlaceHolder>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>                    
    
    <div id="indexRootCategory">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3>Оборудование для магазинов, складов и предприятий общественного питания</h3>
                    <iwc:xsltlistview runat="server" id="xpvCategories" stylesheetlocation="~/xsl/indexCats.xsl"  />
                </div>
            </div>
        </div>
    </div>
    
        <div id="indexPartners">
                <h3>Бренды</h3>
                <div class="slick">
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/e84/dry_ager.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/70a/irinox.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/f75/alphatech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/b65/eurofours.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fd2/rational.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fe6/viessmann.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/404/skaynech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/7af/astra.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fd2/rational.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fe6/viessmann.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/404/skaynech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/7af/astra.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/e84/dry_ager.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/70a/irinox.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/f75/alphatech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/b65/eurofours.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fd2/rational.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fe6/viessmann.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/404/skaynech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/7af/astra.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fd2/rational.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/fe6/viessmann.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/404/skaynech.jpg" alt="" /></a>
                    <a href="#"><img src="http://www.tfdecor.ru/upload/iblock/7af/astra.jpg" alt="" /></a>
                </div>
            </div>
        </div>
        
        <div id="indexAbout">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="marginless">Технологическое оборудование для профессиональной кухни</h3>
                        <br />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="contant-black">                            
                            <p>Группа компаний &laquo;Техно Холод&raquo; предлагает большой выбор услуг и оборудования для профессиональной кухни, магазиностроения, пищевых производств, складских (холодильных) комплексов.</p>
                            <p>Планируя открывать кафе, магазин, пекарню, пищевое производство ознакомьтесь с каталогом продукции на сайте, а также проконсультируйтесь с нашими специалистами. Они ответят на все вопросы, разъяснят особенности и при необходимости помогут подобрать оборудование исходя именно из Ваших потребностей и пожеланий. Если какой-то техники нет на складе, ее можно заказать персонально, в максимально сжатые сроки.</p>
                            <a href="/about/" class="uk-button header__submit_app uk-text-truncate btn-h-s btn-about">Подробнее...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>