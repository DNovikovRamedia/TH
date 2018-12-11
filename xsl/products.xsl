<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="appPath" />
  <xsl:param name="categoryName" />  

  <xsl:template match="/List">        

    <div id="prodList">
      <div id="loadingoverlay"></div>
    <xsl:for-each select="//Product">

      <div class="col-md-3">
        <div class="catalog-item prod-item">
          <div class="catalog-img  prod-item-img">
            <a class="fancy"  href="{@ImageUrl}" title="{@Name}">
              <img src="{@PreviewUrl}" alt="{@Name}" />
            </a>
          </div>
          <div class="catalog-name">
            <a class="fancy"  href="{@ImageUrl}" title="{@Name}">
              <xsl:value-of select="@Name"/>
            </a>
          </div>
          <div class="prod-attr">Длина: <span class="lengthprod"><xsl:value-of select="@Length"/></span></div>
          <div class="prod-attr">Ширина: <span class="widthprod"><xsl:value-of select="@Width"/></span></div>
          <div class="prod-attr">Высота: <span class="heightprod"><xsl:value-of select="@Height"/></span></div>
          <div class="prod-attr">Картон: <span class="kartonprod"><xsl:value-of select="@KartonName"/></span></div>
          <div class="prod-attr">Конфигурация: <span class="configprod"><xsl:value-of select="@ConfigName"/></span></div>
          <div class="add-cart"><span class="cat-count"><input class="spinner" ID="spinner" /></span> <span pid="{@ID}" class="add add-item">Заказать</span></div>
          <div class="raspr"></div>
        </div>
      </div>

    </xsl:for-each>
      <div class="clearfix"></div>

      <div class="cart_done text-center">
        <h2 class="text-center title-done">Товар добавлен в корзину!</h2>
        <br />
        <div class="col-md-6 text-center">
          <div class="btn btn-close btn-danger btn-green">Вернуться к товару</div>
        </div>
        <div class="col-md-6 text-center">
          <div class="btn btn-ref-cart btn-danger btn-green">Перейти в корзину</div>
        </div>
        <br />
        <br />
      </div>
      
    </div>

  </xsl:template>

</xsl:stylesheet>