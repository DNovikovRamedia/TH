<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="KtkLayout"
    ValidateRequest="false" %>

<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Controls" TagPrefix="iwc" %>
<%@ Register Assembly="Ideal.Wision" Namespace="Ideal.Wision.Schema" TagPrefix="cc1" %>
<%@ Register Assembly="Ideal.WebTruth" Namespace="Ideal.WebTruth.Controls" TagPrefix="iwwt" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=1140, initial-scale=1">    
</head>
<body>
    <!--[if lt IE 7]>
        <p class="browsehappy">Вы пользуетесь <strong>устаревшим</strong> браузером. Пожалуйста, <a href="http://browsehappy.com/">обновите браузер</a>.</p>
    <![endif]-->
    <link rel="stylesheet" href="<%=AppPath %>/css/normalize.css">
    <link rel="stylesheet" href="<%=AppPath %>/css/main.css">    
    <%--<link rel="stylesheet" href="<%=AppPath %>/css/bootstrap-grid-3.3.1.min.css" />--%>
    <link href='<%=AppPath %>/bootstrap-3.3.5-dist/css/bootstrap.css' rel='stylesheet'/>
    <link href='<%=AppPath %>/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css' rel='stylesheet'/>
    <link href="https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700" type="text/css" />
    <link rel="stylesheet" href="<%=AppPath %>/css/th.css?v=1.3">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>    

    <link rel="stylesheet" href="<%=AppPath %>/js/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="<%=AppPath %>/js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <link rel="stylesheet" href="<%=AppPath %>/js/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
    <script type="text/javascript" src="<%=AppPath %>/js/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <script type="text/javascript" src="<%=AppPath %>/js/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/js/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="<%=AppPath %>/js/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    
    <%--SPINNER--%>
    <script type="text/javascript" src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    
    <script src="http://code.jboxcdn.com/0.3.2/jBox.min.js"></script>
    <link href="http://code.jboxcdn.com/0.3.2/jBox.css" rel="stylesheet">
    <link href="<%=AppPath %>/js/jbox/themes/ModalBorder.css" rel="stylesheet">
    <link href="<%=AppPath %>/js/jbox/themes/NoticeBorder.css" rel="stylesheet">
    <link href="<%=AppPath %>/js/jbox/themes/TooltipBorder.css" rel="stylesheet">
    <link href="<%=AppPath %>/js/jbox/themes/TooltipDark.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    
    <!--OWL-->
    <link rel="stylesheet" href="<%=AppPath %>/js/OwlCarousel2/owl.carousel.css">
    <link rel="stylesheet" href="<%=AppPath %>/js/OwlCarousel2/owl.theme.default.css">
    <script src="<%=AppPath %>/js/OwlCarousel2/owl.carousel.js"></script>
    <!--OWL END-->
    
    <%--MENU--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/js/superfish.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.5.3/core/js/jquery.mmenu.min.all.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/css/superfish.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/superfish/1.7.7/css/megafish.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jQuery.mmenu/5.5.3/core/css/jquery.mmenu.all.css">
	<%--MENU END--%>
	
	<script src="<%=AppPath %>/js/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/js/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="<%=AppPath %>/js/slick/slick-theme.css"/>
    
    <%--<script type="text/javascript" src="<%=AppPath %>/js/catalog.js?v=1.3.2018"></script>--%>
    <script type="text/javascript" src="<%=AppPath %>/js/th.js?v=1.4"></script>    
    
<form id="th" runat="server">

    <div id="header">
     <div class="container">
        <div class="row">
            <div class="col-md-4 text-left header-logo"><a href="<%=AppPath %>/index.aspx"><img src="<%=AppPath %>/ii/logo.png" alt="Технохолод" /></a></div>
            <div class="col-md-3 header-cont">
                <div class="head-address">г. Кострома, ул. Галичская, 100</div>
                <div class="head-shed">пн-пт: 09.00 - 18.00<br />
                сб: 09.00 - 14.00<br />
                воскр: выходной</div>
            </div>
            <div class="col-md-3">           
                <span class="header__phone"><span style="display:inline"><svg style="margin-top:5px;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
<path fill="#c6c6c6" d="M11.001,0H5C3.896,0,3,0.896,3,2c0,0.273,0,11.727,0,12c0,1.104,0.896,2,2,2h6c1.104,0,2-0.896,2-2
c0-0.273,0-11.727,0-12C13.001,0.896,12.105,0,11.001,0z M8,15c-0.552,0-1-0.447-1-1s0.448-1,1-1s1,0.447,1,1S8.553,15,8,15z
				M11.001,12H5V2h6V12z"></path>
</svg> 8 (4942) 49-95-06 </span></span>		
                <a href="#submit_app" data-uk-modal="" class="uk-button header__submit_app uk-text-truncate btn-h-s">Напишите нам</a>                        
            </div>
            <div class="col-md-2 text-right">
                <a class="blueref header-call" href="">Перезвоните мне</a>
                <br />
                <input name="q" placeholder="Искать продукцию..." class="header-search" type="text">      
            </div>
        </div>
     </div>
    </div>
    
    <div id="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                
                <%--MENU--%>
                    <nav class="top-line clearfix" id="main-menu"> 
                        <a href="#mobile-menu" class="toggle-mnu"><span></span></a>
                        <div class="top-mnu">					
					    <ul class="sf-menu">
						    <li><a href="<%=AppPath %>/index.aspx">Главная</a></li>
						    <li><a href="<%=AppPath %>/about/index.aspx">О компании</a>
						    <li><a href="<%=AppPath %>/services/index.aspx">Услуги<i class="fa fa-caret-down"></i></a>
						        <ul>
								    <li><a href="<%=AppPath %>/about/teh/index.aspx">Техническое обслуживание</a></li>
								    <li><a href="<%=AppPath %>/about/proj/index.aspx">Разработка проектов</a></li>
							    </ul>
						    </li>
						    <li>
							    <a href="<%=AppPath %>/catalog/index.aspx">Каталог<i class="fa fa-caret-down"></i></a>
							    <ul>
								    <asp:Literal ID="ltCategories" runat="server" EnableViewState="false" />
							    </ul>
						    </li>
						    <!--li><a href="<%=AppPath %>/portfolio/index.aspx">Портфолио</a></li-->
						    <li><a href="<%=AppPath %>/jobs/index.aspx">Вакансии</a></li>
						    <!--li><a href="<%=AppPath %>/spec/index.aspx">Специалистам</a></li>				
						    <li><a href="<%=AppPath %>/specials/index.aspx">Спецпредложения</a></li>
						    <li><a href="<%=AppPath %>/used/index.aspx">Оборудование б/у</a></li-->
						    <li><a href="<%=AppPath %>/contacts/index.aspx">Контакты</a></li>
					    </ul>
				        </div> 
				        <div class="clearfix"></div>
                    </nav>
                    <%--MENU END--%>
                </div>                    
            </div>            
        </div>        
    </div>    
    
    <div class="main-contant block-gray">
       <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div id="nav"><iwc:navigator id="navMain" runat="server" rootname="Главная" partdivider="&nbsp;<span class='small'>&gt;</span>&nbsp;" /></div>
                    <iwc:contenttitle id="ContTitle" runat="server" titleformat="<h1>{0}</h1>" />            
                    <div class="clear"></div>            
                    <cc1:container id="contDefault" runat="server" />            
                </div> 
            </div>
       </div>              
    </div>  
    
    <div id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="bottom-menu">
                        <ul>
                            <li><a href="<%=AppPath %>/index.aspx">Главная</a></li>
						    <li><a href="<%=AppPath %>/about/index.aspx">О компании</a></li>
						    <li><a href="<%=AppPath %>/services/index.aspx">Услуги</a></li>
						    <li><a href="<%=AppPath %>/catalog/index.aspx">Каталог</a></li>
						    <!--li><a href="<%=AppPath %>/portfolio/index.aspx">Портфолио</a></li-->
						    <li><a href="<%=AppPath %>/jobs/index.aspx">Вакансии</a></li>
						    <!--li><a href="<%=AppPath %>/spec/index.aspx">Специалистам</a></li>				
						    <li><a href="<%=AppPath %>/specials/index.aspx">Спецпредложения</a></li>
						    <li><a href="<%=AppPath %>/used/index.aspx">Оборудование б/у</a></li-->
						    <li><a href="<%=AppPath %>/contacts/index.aspx">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="clear"></div>
    
    <div id="footerhr"></div>    
    
    <div id="subFooter">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-left">
                    &copy; 2017 ТехноХолод - технологическое оборудование
                </div>
                <div class="col-md-3 clr-black text-center">
                    <svg style="margin-top:5px;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
<path fill="#c6c6c6" d="M11.001,0H5C3.896,0,3,0.896,3,2c0,0.273,0,11.727,0,12c0,1.104,0.896,2,2,2h6c1.104,0,2-0.896,2-2
c0-0.273,0-11.727,0-12C13.001,0.896,12.105,0,11.001,0z M8,15c-0.552,0-1-0.447-1-1s0.448-1,1-1s1,0.447,1,1S8.553,15,8,15z
				M11.001,12H5V2h6V12z"></path>
</svg> 8 (4942) 49-95-06 
                </div>
                <div class="col-md-4 clr-black text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
<g>
<g>
<path fill="#c6c6c6" d="M8,16c-0.256,0-0.512-0.098-0.707-0.293C7.077,15.491,2,10.364,2,6c0-3.309,2.691-6,6-6
c3.309,0,6,2.691,6,6c0,4.364-5.077,9.491-5.293,9.707C8.512,15.902,8.256,16,8,16z M8,2C5.795,2,4,3.794,4,6
c0,2.496,2.459,5.799,4,7.536c1.541-1.737,4-5.04,4-7.536C12.001,3.794,10.206,2,8,2z"></path>
</g>
<g>
<circle fill="#c6c6c6" cx="8.001" cy="6" r="2"></circle>
</g>
</g>
</svg> г. Кострома, ул. Галичская, 100
                </div>
                <div class="col-md-2 text-right">
                    <div id="dev-foo">Создание сайта: <a href="http://ramedia.ru" target="_blank">Рамедиа</a></div>
                </div>
            </div>
        </div>
    </div>

</form>
    
<iwwt:webtruthcollector runat="server" id="iwwtStats" />
    
</body>
</html>
