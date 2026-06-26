<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/*">
    <patchset  cp="{@cp}" version="{@version}">
      <xsl:apply-templates />
    </patchset>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:copy>
      <xsl:copy-of select="@*"/>    
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="element">
    <xsl:variable name="elementPosition"  select="count(./preceding-sibling::element) + 1"/>
    <element id="{replace(@id,'-[0-9]{1,2}@',concat('-',$elementPosition,'@'))}" type="{@type}">
      <xsl:copy-of select="*"/>  
    </element>
  </xsl:template>  
</xsl:stylesheet>