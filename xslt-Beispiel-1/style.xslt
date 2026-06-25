<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
	<xsl:template match="infos">
		<xsl:element name="infos">
			<xsl:for-each-group select="info" group-by="concat(@prid, '|', @locid, '|', @from)">
				<info prid="{@prid}" locid="{@locid}" from="{@from}">
					<xsl:for-each select="current-group()">
						<prname qt="{@qt}"><xsl:value-of select="@prname"/></prname>
					</xsl:for-each>
				</info>
			</xsl:for-each-group>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>


