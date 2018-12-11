   /*var myModal = {};          
   var myModalCartDone = {};
   var content = {}; */
   
   var modal_options = {    
    preventDefault: true,
    fixed: true,
    reposition: true,
    repositionOnOpen: true,
    repositionOnContent: true,
    overlay: true,
    reload: true,
    addClass: "my_modal",
    //closeButton: 'box'
    onClose: function () {
        //this.destroy();
}
}

var modal_options_call = { 
    animation: {open: 'move:top', close: 'slide:top'},
    preventDefault: true,
    fixed: true,
    reposition: true,
    repositionOnOpen: true,
    repositionOnContent: true,
    overlay: true,
    reload: true,
    addClass: "my_modal",    
    addClass: 'call_form',
    onClose: function () {
        //this.destroy();
    }
}

var modal_options_error = {        
        animation:'flip',
        position:{x:'center',y:'center'},
        autoClose:5000,
        onInit:function(){this.options.color="red";}
    }
var modal_options_succes = {
        animation:'flip',
        //position:{x:'right',y:'100'},        
			position: {
				x: 15,
				y: 15
			},
        autoClose:5000,
        onInit:function(){this.options.color="green";}
    }
    
var modal_options_error_cat = {        
        title: 'Внимание!',
        content: 'Не заданы все параметры заказа',
        closeButton: 'box',
        animation:'flip',
        /*theme: 'TooltipBorder',*/
        addClass: "my_modal_err"            
    }
   

$(document).ready(function() {

$('.owl-carousel').owlCarousel({
    loop:true,
    autoplay:true,      
    autoplayHoverPause:true,
    margin:10,
    responsiveClass:true,
    responsive:{
        0:{
            items:1,
            nav:false
        },
        600:{
            items:3,
            nav:false
        },
        1000:{
            items:4,
            nav:false
        }
    }
    });
    
    $('.single-item').slick({
      infinite: true,
      dots: false,    
      autoplay: true
    });
    
    $('.slick').slick({
      infinite: true,
      speed: 300,
      slidesToShow: 13, // workaround
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 3000,
      dots: false,
      arrows: false,
      variableWidth: true
    });

    
/*$('.owl-carousel1').owlCarousel({
    loop:true,
    autoplay:true,      
    autoplayHoverPause:true,
    margin:10,
    responsiveClass:true,
    responsive:{
        0:{
            items:1,
            nav:false
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:2,
            nav:false
        }
    }
    });*/

$("a.fancy").fancybox(
{'overlayOpacity' : 0.7,
 'overlayColor' : '#f8fef8',
 "padding" : 5,
 "imageScale" : false, 
		"zoomOpacity" : false,
		"zoomSpeedIn" : 1000,	
		"zoomSpeedOut" : 1000,	
		"zoomSpeedChange" : 1000, 
		"transitionIn" : 'elastic',
		"transitionOut" : 'elastic',
		"overlayShow" : true, 
		"overlayOpacity" : 0.8,	
		"hideOnContentClick" :false,
		"titlePosition" : 'inside',
		"centerOnScroll" : true
});
    
//SPINNER
    spinnerInit();
//SPINNER END 
    
//ДОБАВЛЕНИЕ ТОВАРА В КОРЗИНУ
/*$('.add-item').on('click', function () {    
   addToCart($(this));    
})*/

$( document ).on( "click", ".add-item", function() {
    addToCart($(this));
});

$('.btn-close').on('click', function () {         
    //myModalCartDone.close();
    //alert(111);
})
$('.btn-ref-cart').on('click', function () {         
    window.location.href = '/catalog/cart.aspx';
})
//ДОБАВЛЕНИЕ ТОВАРА В КОРЗИНУ КОНЕЦ

RefreshCartCount();

/*MENU*/
    $(".sf-menu").superfish({
		delay: 200,
		speed: "fast",
		cssArrows: false
	})
	.after("<div id='mobile-menu'>").clone().appendTo("#mobile-menu");
	$("#mobile-menu").find("*").attr("style", "");
	$("#mobile-menu").children("ul").removeClass("sf-menu")
	.parent().mmenu({
		extensions : [ 'widescreen', 'theme-white', 'effect-menu-slide', 'pagedim-black' ],
		navbar: {
			title: "MENU"
		}
	});

	$(".toggle-mnu").click(function() {
		$(this).addClass("on");
	});

	var api = $("#mobile-menu").data("mmenu");
	api.bind("closed", function () {
		$(".toggle-mnu").removeClass("on");
	});
/*MENU END*/
    
}); //END READY

function addToCart(_this)
{   
   content = {};
   var yep = false; 
   var pid = _this.attr("pid"); 
   
   var length = _this.parent().parent().find('.lengthprod').html();
   var width = _this.parent().parent().find('.widthprod').html();
   var height = _this.parent().parent().find('.heightprod').html();
   var karton = _this.parent().parent().find('.kartonprod').html();
   var config = _this.parent().parent().find('.configprod').html();     
   
   if (pid.length > 0)// если id существует
   {        
        var prodCount = parseFloat(_this.parent().find('.cat-count').find('.spinner').val()); //количество
           if ($.isNumeric(prodCount))
                {
                    yep = true;
                }
                else
                {
                    prodCount = 1;                    
                    yep = false;
                }
   }
   else
   {
        yep = false;
   }   
              
    if (yep)
    {
        $.ajax({
                async: true,
                cache: false,
                dataType: 'html',
                reload: false,
                getData: 'data-ajax',
                setContent: true,
                spinner: false,
                url: "/catalog/cart.ashx?pid=" + pid + "&count=" + prodCount + "&length=" + length + "&width=" + width + "&height=" + height + "&karton=" + karton + "&config=" + config,
                //url: "/Web/catalog/cart.ashx?pid=" + pid + "&count=" + prodCount + "&length=" + length + "&width=" + width + "&height=" + height + "&karton=" + karton + "&config=" + config,
                success: function(data) {  
                RefreshCartCount();
                /*var myModal = new jBox('Modal', modal_options_call);           
                var content = $('.cart_done');
                myModal.open().setContent(content); */
                //myModalCartDone = myModal;
                /*mc_notice = new jBox('Notice', modal_options_succes);
                mc_notice.setContent("Добавлено в корзину!");*/
                //window.parent.$.fancybox.close();
                var mc_notice = new jBox('Notice', modal_options_succes);
                mc_notice.setContent("Добавлено в корзину!");
                }
         });         
     }
     else
     {
        var myModalErr = new jBox('Modal', modal_options_error_cat); 
        myModalErr.open();
     }
}

function RefreshCartCount()
{
    $.ajax({
            async: true,
            cache: false,
            dataType: 'html',
            reload: false,
            getData: 'data-ajax',
            setContent: true,
            spinner: false,
            url: "/catalog/cartCount.ashx",
            //url: "/Web/catalog/cartCount.ashx",
            success: function(data) {               
                var arr = data.split('|');                
                $("#cart_count_header").html(arr[0]);
                $("#cart_amount_header").html(arr[1]);
            }
                        
     });
}

function LoadFilterProduct(_typeLoad)
{
    var catId = $("#ctl06_hfCatid").val();
    
    var karton = $("#ctl06_ddlKart").val();
    var config = $("#ctl06_ddlConf").val();
    var minLength = $("#ctl06_tbLengthMin").val();
    var maxLength = $("#ctl06_tbLengthMax").val();
    var minHeight = $("#ctl06_tbHeightMin").val();
    var maxHeight = $("#ctl06_tbHeightMax").val();
    var minWidth = $("#ctl06_tbWidthMin").val();
    var maxWidth = $("#ctl06_tbWidthMax").val();          
    
    var url = "/catalog/catalog.ashx?catId=" + catId + "&karton=" + karton + "&config=" + config + "&minLength=" + minLength + "&maxLength=" + maxLength + "&minHeight=" + minHeight + "&maxHeight=" + maxHeight + "&minWidth=" + minWidth + "&maxWidth=" + maxWidth + "&typeLoad=" + _typeLoad;
    //var url = "/Web/catalog/catalog.ashx?catId=" + catId + "&karton=" + karton + "&config=" + config + "&minLength=" + minLength + "&maxLength=" + maxLength + "&minHeight=" + minHeight + "&maxHeight=" + maxHeight + "&minWidth=" + minWidth + "&maxWidth=" + maxWidth + "&typeLoad=" + _typeLoad;    
    
    $.ajax({
        async: true,
        cache: false,
        /*dataType: "json",*/
        url: url,                
        //complete: $("#loadingoverlay").css('display', 'none'),
        success: function(data) {                            
            $("#prodList").html(data.ProductsHtml);            
            $("#loadingoverlay").css('display', 'none');
            spinnerInit();
            /*$( document ).on( "click", ".add-item", function() {
                addToCart($(this));
            });*/
        }
        //success: selectorChangedLoad
    });
}

function ResetInput()
{
    $(".filter-prod input[type=text]").val("0");
    $(".filter-prod select").prop("selectedIndex", 0);
}

function spinnerInit()
{
    $( ".spinner" ).keypress(function(e) {
    if (e.which != 8 && e.which != 0 && e.which != 46 && (e.which < 48 || e.which > 57)) {
    return false;
    }
    });

    spinner = $( ".spinner" ).spinner({ 
        numberFormat: "n",
        max: 50, 
        min: 1,         
        stop: function( event, ui ) {
           //var check_current = $(this).parent().parent().parent().find('.order');  
           //spinner_current_count = $(this).val();
           
           //check_current.prop("checked", true); 
           //check_current.change();
                      
           //id = $(this).attr("name");
           //calculation(id);
        }
     }); 
     spinner.spinner("value", "1");
}