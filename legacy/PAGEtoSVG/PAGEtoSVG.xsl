<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright PRImA Research 2010, Stefan Pletschacher -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/2000/svg"
	xmlns:xalan="http://xml.apache.org/xalan"
	xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:output method="xml" indent="yes" xalan:indent-amount="4"
		cdata-section-elements="script style"/>
	<!-- <xsl:strip-space elements="*"/> -->

 	<!-- Includes (individual stylesheets for all format version) -->
	<xsl:include href="pc_2010-03-19.xsl"/>
	<xsl:include href="pc_2010-01-12.xsl"/>
	<xsl:include href="pc_2013-07-15.xsl"/>

 	<!-- External parameters -->
	<xsl:param name="mode"/>	<!-- static or interactive -->
	<xsl:param name="level"/>	<!-- level(s) to render (e.g. regions) -->
	<xsl:param name="embed"/>	<!-- true: embed css and js in resulting svg file
								otherwise link to external files -->
	<xsl:param name="fbgimg"/>	<!-- forced background image (if not specified,
								the one given in the PAGE file will be used) -->
	<xsl:param name="fcss"/>	<!-- forced css file (if not specified,
								style.css will be used) -->
	
	<!-- Set defaults -->
	<xsl:variable name="dispMode">
		<xsl:choose>
			<xsl:when test="$mode='static'">static</xsl:when>
			<xsl:otherwise>interactive</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="dispLevel"> 
		<xsl:choose>
			<xsl:when test="$level='all'">all</xsl:when>
			<xsl:when test="$level='border'">border</xsl:when>
			<xsl:when test="$level='printspace'">printspace</xsl:when>
			<xsl:when test="$level='regions'">regions</xsl:when>
			<xsl:when test="$level='textlines'">textlines</xsl:when>
			<xsl:when test="$level='words'">words</xsl:when>
			<xsl:when test="$level='glyphs'">glyphs</xsl:when>
			<xsl:otherwise>all</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="embExt">
		<xsl:choose>
			<xsl:when test="$embed='false'">false</xsl:when>
			<xsl:otherwise>true</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="forcedBgImg">
		<xsl:choose>
			<xsl:when test="string-length($fbgimg)>0">
				<xsl:value-of select="$fbgimg"/>
			</xsl:when>
			<xsl:otherwise>false</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="cssStylesheet">
		<xsl:choose>
			<xsl:when test="string-length($fcss)>0">
				<xsl:value-of select="$fcss"/>
			</xsl:when>
			<xsl:otherwise>style.css</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="bgImageExtension">.jpg</xsl:variable>
	<!-- Used if linking to external files (embExt='false') -->
	<xsl:variable name="scripts">scripts.js</xsl:variable>
	
	<!-- Used if embedding js and css (embExt='true') -->
	<xsl:variable name="cssEmb">style.css.xml</xsl:variable>
	<xsl:variable name="jsEmb">scripts.js.xml</xsl:variable>
		
	<xsl:variable name="svgWidth">1024</xsl:variable>
	<xsl:variable name="svgHeight">810</xsl:variable>

	<xsl:variable name="contentBoxXPos">360</xsl:variable>
	<xsl:variable name="contentBoxYPos">110</xsl:variable>
	<xsl:variable name="contentBoxWidth">640</xsl:variable>
	<xsl:variable name="contentBoxHeight">700</xsl:variable>

	<xsl:variable name="controlBoxXPos">360</xsl:variable>
	<xsl:variable name="controlBoxYPos">110</xsl:variable>
	<xsl:variable name="controlBoxWidth">135</xsl:variable>
	<xsl:variable name="controlBoxHeight">60</xsl:variable>

	<xsl:template match="/">
		<!-- <xsl:comment>*** Document Start ***</xsl:comment> -->
		<!-- <xsl:value-of select="$newline"/> -->

		<!-- Link to an external stylesheet-->
		<xsl:if test="$embExt='false'">
			<xsl:processing-instruction name="xml-stylesheet">
				<xsl:text>href="</xsl:text>
				<xsl:value-of select="$cssStylesheet"/>
				<xsl:text>" type="text/css"</xsl:text>
			</xsl:processing-instruction>
		</xsl:if>
		
		<!-- <xsl:value-of select="$newline"/> -->
		<xsl:apply-templates/>
		<!-- see included xsl files for namespace-aware handling of elements  -->
		
		<!-- <xsl:comment>*** Document End ***</xsl:comment> -->		
	</xsl:template>

	<!-- do nothing i.e. delete -->
	<xsl:template match="@*|node()"></xsl:template>


	
<xsl:variable name="newline">
<xsl:text>
</xsl:text>
</xsl:variable>

</xsl:stylesheet>