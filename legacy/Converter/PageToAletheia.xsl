<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pc="http://schema.primaresearch.org/PAGE/gts/pagecontent/2010-01-12"
	xmlns="http://schema.primaresearch.org/gt/gts/pagecontent/2009-04-27"
	xmlns:xalan="http://xml.apache.org/xalan">
	<xsl:output method="xml" indent="yes" xalan:indent-amount="4"/>
	<!-- <xsl:strip-space elements="*"/> -->
 
 	<xsl:template match="/">
		<!-- <xsl:comment>*** Document Start ***</xsl:comment> -->
		<!-- <xsl:value-of select="$newline"/> -->
		<xsl:apply-templates/>
		<!-- <xsl:comment>*** Document End ***</xsl:comment> -->		
	</xsl:template>
	 
	<xsl:template match="pc:PcGts">
		<xsl:element name="pcGts">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:Metadata">
		<xsl:element name="pcMetadata">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Creator">
		<xsl:element name="pcCreator">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:Created">
		<xsl:element name="pcCreated">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:LastChange">
		<xsl:element name="pcLastChange">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:Comments">
		<xsl:element name="pcComments">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:Page">
		<xsl:element name="page">
			<xsl:attribute name="image_filename">
				<xsl:value-of select="@imageFilename"/>
			</xsl:attribute>
			<xsl:attribute name="image_width">
				<xsl:value-of select="@imageWidth"/>
			</xsl:attribute>
			<xsl:attribute name="image_height">
				<xsl:value-of select="@imageHeight"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Border"/>

	<xsl:template match="pc:PrintSpace"/>

	<xsl:template match="pc:ReadingOrder"/>

	<xsl:template match="pc:TextRegion">
		<xsl:element name="text_region">
			<xsl:call-template name="HandleId"/>
			
			<xsl:if test="count(@type)!=0">
				<xsl:attribute name="txt_type">
					<xsl:choose>
						<xsl:when test="@type='paragraph'">
							<xsl:text>Paragraph</xsl:text>
						</xsl:when>
						<xsl:when test="@type='heading'">
							<xsl:text>Heading</xsl:text>
						</xsl:when>
						<xsl:when test="@type='floating'">
							<xsl:text>Sentence</xsl:text>
						</xsl:when>
						<xsl:when test="@type='caption'">
							<xsl:text>Caption</xsl:text>
						</xsl:when>
						<xsl:when test="@type='header'">
							<xsl:text>Header</xsl:text>
						</xsl:when>
						<xsl:when test="@type='footer'">
							<xsl:text>Footer</xsl:text>
						</xsl:when>
						<xsl:when test="@type='page-number'">
							<xsl:text>Page_Number</xsl:text>
						</xsl:when>
						<xsl:when test="@type='drop-capital'">
							<xsl:text>Drop_Capital</xsl:text>
						</xsl:when>
						<xsl:when test="@type='credit'">
							<xsl:text>Credit</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Coords">
		<xsl:element name="coords">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Point">
		<xsl:element name="point">
			<xsl:attribute name="x">
				<xsl:value-of select="@x"/>
			</xsl:attribute>
			<xsl:attribute name="y">
				<xsl:value-of select="@y"/>
			</xsl:attribute>		
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:TextLine">
		<xsl:element name="text_line">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Word">
		<xsl:element name="word">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Glyph">
		<xsl:element name="glyph">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


	<xsl:template match="pc:ImageRegion">
		<xsl:element name="image_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:LineDrawingRegion">
		<xsl:element name="line_drawing_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:GraphicRegion">
		<xsl:element name="graphic_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="pc:TableRegion">
		<xsl:element name="table_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="pc:ChartRegion">
		<xsl:element name="chart_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	

	<xsl:template match="pc:SeparatorRegion">
		<xsl:element name="separator_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:MathsRegion">
		<xsl:element name="maths_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:NoiseRegion">
		<xsl:element name="noise_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:FrameRegion">
		<xsl:element name="frame_region">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<!--  Do nothing for these elements -->
	<xsl:template match="pc:TextEquiv"/>


<!-- auxiliary stuff -->

	<xsl:template name="HandleId">
		<xsl:choose>
			<xsl:when test="count(@id)=0">
				<xsl:attribute name="id">
					<xsl:value-of select="generate-id()"/>
				</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- warning on missed elements -->
	<xsl:template name="CheckMissed">
		<xsl:for-each select="child::node()">
			<xsl:if test="not(self::text())">MISSED!</xsl:if>		
		</xsl:for-each>
	</xsl:template>
	
	<!-- warning on missed attributes --> 
	<xsl:template match="@*">
		<xsl:text>
		
		
		</xsl:text>
		<xsl:element name="Warning-MissedAttribute"/>
		Name:<xsl:value-of select="name()"/>#
		Value:<xsl:value-of select="."/>#
		<xsl:comment>*** *** *** Attribute Warning, created through catch all template *** *** ***</xsl:comment>
		<xsl:text>
		</xsl:text>
	</xsl:template>


	<!-- warn on missed elements -->
	<xsl:template match="node()">
		<xsl:choose>
	  		<xsl:when test="self::text() and name(.)=''">
				<!-- <xsl:text>False Alarm - empty text element</xsl:text> -->
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>
				
				
				
				</xsl:text>
				<xsl:element name="Warning-MissedElement"/>
				<xsl:text>
				</xsl:text>
				<xsl:if test="self::*">NodeType</xsl:if>
				<xsl:if test="self::comment()">CommentType</xsl:if>
				<xsl:if test="self::text()">TextType</xsl:if>
				<xsl:if test="self::processing-instruction()">ProcessingInstructionType</xsl:if>
			
				Name:<xsl:value-of select="name()"/>#
				Value:<xsl:value-of select="."/>#
				<xsl:comment>*** *** *** Element Warning, created through catch all template *** *** ***</xsl:comment>
				<xsl:text>
				</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
 
	<!-- warn on missed comments etc.  
	<xsl:template match="comment()|processing-instruction()">
		<xsl:copy />
	</xsl:template>
	-->

	
<!--
		<xsl:comment>*** *** *** Marker *** *** ***</xsl:comment>
-->

<xsl:variable name="newline">
<xsl:text>
</xsl:text>
</xsl:variable>

</xsl:stylesheet>