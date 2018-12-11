$(document).ready(function() {
    
    $("#fltrSet").click(function(){
        $("#loadingoverlay").css('display', 'block'); 
        LoadFilterProduct("filter");        
    });
    $("#fltrReset").click(function(){
        $("#loadingoverlay").css('display', 'block');
        ResetInput();
        LoadFilterProduct("reset");        
    });
    
}); //END READY

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
        dataType: "json",
        url: url,                
        //complete: $("#loadingoverlay").css('display', 'none'),
        success: function(data) {                            
            $("#prodList").html(data.ProductsHtml);
        }
        //success: selectorChangedLoad
    });
}

function ResetInput()
{
    $(".filter-prod input[type=text]").val("0");
    $(".filter-prod select").prop("selectedIndex", 0);
}