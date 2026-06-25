<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <xsl:template match="/*">
        <component>
            <xsl:apply-templates select="node"/>
            <xsl:for-each select="//node">
                <xsl:apply-templates select="." mode="link"/>
            </xsl:for-each>
        </component>
        <!---->
    </xsl:template>
    
    <xsl:template match="node">
     <xsl:variable name="imgId">
            <xsl:call-template name="generateLinkSrc" />
        </xsl:variable>
        <img id="{$imgId}"/>
    </xsl:template>
    
    <xsl:template match="node" mode="link">
        <xsl:variable name="linkSrcId">
            <xsl:call-template name="generateLinkSrc" />
        </xsl:variable>
        <link linkSrc="{$linkSrcId}" src="{name}" name="{id}"/>
    </xsl:template>
    
    <xsl:template name="generateLinkSrc">
        <xsl:variable name="linkSRc">
            <xsl:text>linkimg</xsl:text>
            <xsl:number value="count(preceding::node) + 1" format= "0001"/>
        </xsl:variable>
        <xsl:value-of select="$linkSRc"/>
    </xsl:template>
    
</xsl:stylesheet>