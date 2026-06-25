<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="lst" select="document('input/lst.xml')"/>
    
    <xsl:template match="/*">
        <ls>
            <xsl:apply-templates select="*"/>
        </ls>
    </xsl:template>
    
    <xsl:template match="name">
        <xsl:if test="@activ='yes'">
            <xsl:variable name="info">
                <xsl:call-template name="getInfo">
                    <xsl:with-param name="id" select="@id"/>
                </xsl:call-template>
            </xsl:variable>
            
            <l id="{@id}">
                <xsl:value-of select="."/>
                <b><xsl:value-of select="$info"/></b>
            </l>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="getInfo">
        <xsl:param name="id"/>
        <xsl:value-of select="concat($lst//*[@id=$id]/@address,' - ',$lst//*[@id=$id]/@age)"/>
    </xsl:template>

</xsl:stylesheet>