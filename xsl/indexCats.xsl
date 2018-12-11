<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:param name="callPostbackCode" />
  <xsl:param name="postbackFunction" />
  <xsl:param name="appPath" />

  <xsl:template match="/List">
    <div class="categories">

      <xsl:for-each select="/List/ProductCategory">

        <div class="col-md-4 text-center">
          <a href="{$appPath}/catalog/{@ID}/" title="{@Name}">
            <div class="item">
              <div class="img">
                <img src="{@ImageUrl}" alt="{@Name}" />
              </div>

              <div class="name">
                <xsl:value-of select="@Name"/>
              </div>
            </div>
          </a>
        </div>

      </xsl:for-each>
    </div>

    <div class="clearfix"></div>

  </xsl:template>
</xsl:stylesheet>