<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no"/>

	<xsl:strip-space elements="*"/>
 	
	<!-- modified standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<!-- do nothing i.e. delete -->
	<xsl:template match="node()[name()='text_equiv']"></xsl:template>

</xsl:stylesheet>