<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pc="http://schema.primaresearch.org/gt/gts/pagecontent/2009-04-27"
	xmlns="http://schema.primaresearch.org/PAGE/gts/pagecontent/2010-01-12"
	xmlns:xalan="http://xml.apache.org/xalan">
	<xsl:output method="xml" indent="yes" xalan:indent-amount="4"/>
	<!-- <xsl:strip-space elements="*"/> -->
 
 	<xsl:template match="/">
		<!-- <xsl:comment>*** Document Start ***</xsl:comment> -->
		<!-- <xsl:value-of select="$newline"/> -->
		<xsl:apply-templates/>
		<!-- <xsl:comment>*** Document End ***</xsl:comment> -->		
	</xsl:template>
	
	<xsl:template match="pc:pcGts">
		<xsl:element name="PcGts">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">http://schema.primaresearch.org/PAGE/gts/pagecontent/2010-01-12 http://schema.primaresearch.org/PAGE/gts/pagecontent/2010-01-12/pagecontent.xsd</xsl:attribute>
<!--  TODO set ID properly! -->
			<xsl:attribute name="pcGtsId">
				<xsl:value-of select="concat('pc-',substring-before(pc:page/@image_filename,'.tif'))"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:pcMetadata">
		<xsl:element name="Metadata">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:pcCreator">
		<xsl:element name="Creator">
			<!-- <xsl:value-of select="."/> -->
<!-- TODO this should be changed back if it is required to keep the original information -->
			<xsl:text>PRImA Research</xsl:text>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:pcCreated">
		<xsl:element name="Created">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:pcLastChange">
		<xsl:element name="LastChange">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:pcComments">
		<xsl:element name="Comments">
			<xsl:value-of select="."/>
		</xsl:element>
		<xsl:call-template name="CheckMissed"/>
	</xsl:template>

	<xsl:template match="pc:page">
		<xsl:element name="Page">
			<xsl:attribute name="imageFilename">
				<xsl:value-of select="@image_filename"/>
			</xsl:attribute>
			<xsl:attribute name="imageWidth">
				<xsl:value-of select="@image_width"/>
			</xsl:attribute>
			<xsl:attribute name="imageHeight">
				<xsl:value-of select="@image_height"/>
			</xsl:attribute>

			<xsl:call-template name="HandleBorder"/>
			<xsl:call-template name="HandlePrintSpace"/>
			<xsl:call-template name="HandleReadingOrder"/>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template name="HandleBorder">
		<xsl:for-each select="pc:border">
			<xsl:element name="Border">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<!-- do nothing (already handled) -->
	<xsl:template match="pc:border"/>

	<xsl:template name="HandlePrintSpace">
		<xsl:for-each select="pc:print_space">
			<xsl:element name="PrintSpace">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<!-- do nothing (already handled) -->
	<xsl:template match="pc:print_space"/>

	<xsl:template name="HandleReadingOrder">
		<xsl:for-each select="pc:reading_order">
			<xsl:element name="ReadingOrder">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

	<!-- do nothing (already handled) -->
	<xsl:template match="pc:reading_order">XXX Warning: reading_order found XXX</xsl:template>

	<xsl:template match="pc:text_region">
		<xsl:element name="TextRegion">
			<xsl:call-template name="HandleId"/>
			
			<xsl:if test="count(@txt_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@txt_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_leading)!=0">
				<xsl:attribute name="leading">
					<xsl:value-of select="@txt_leading"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_reading_direction)!=0">
				<xsl:attribute name="readingDirection">
					<xsl:choose>
						<xsl:when test="@txt_reading_direction='Left_To_Right'">
							<xsl:text>left-to-right</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_reading_direction='Right_To_Left'">
							<xsl:text>right-to-left</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_reading_direction='Top_To_Bottom'">
							<xsl:text>top-to-bottom</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_reading_direction='Bottom_To_Top'">
							<xsl:text>bottom-to-top</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_type)!=0">
				<xsl:attribute name="type">
					<xsl:choose>
						<xsl:when test="@txt_type='Paragraph'">
							<xsl:text>paragraph</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Heading'">
							<xsl:text>heading</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Sub_Heading'">
							<xsl:text>heading</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Sentence'">
							<xsl:text>floating</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Caption'">
							<xsl:text>caption</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Header'">
							<xsl:text>header</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Footer'">
							<xsl:text>footer</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Page_Number'">
							<xsl:text>page-number</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Quote'">
							<xsl:text>floating</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Drop_Capital'">
							<xsl:text>drop-capital</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_type='Credit'">
							<xsl:text>credit</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_colour)!=0">
				<xsl:attribute name="textColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@txt_colour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@txt_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_reverse_video)!=0">
				<xsl:attribute name="reverseVideo">
					<xsl:choose>
						<xsl:when test="@txt_reverse_video='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_reverse_video='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_font_size)!=0">
				<xsl:attribute name="fontSize">
					<xsl:value-of select="@txt_font_size"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_kerning)!=0">
				<xsl:attribute name="kerning">
					<xsl:value-of select="@txt_kerning"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_reading_orientation)!=0">
				<xsl:attribute name="readingOrientation">
					<xsl:value-of select="@txt_reading_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_indented)!=0">
				<xsl:attribute name="indented">
					<xsl:choose>
						<xsl:when test="@txt_indented='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@txt_indented='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_primary_language)!=0">
				<xsl:attribute name="primaryLanguage">
					<xsl:value-of select="@txt_primary_language"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_secondary_language)!=0">
				<xsl:attribute name="secondaryLanguage">
					<xsl:value-of select="@txt_secondary_language"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_primary_script)!=0">
				<xsl:attribute name="primaryScript">
					<xsl:value-of select="@txt_primary_script"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@txt_secondary_script)!=0">
				<xsl:attribute name="secondaryScript">
					<xsl:value-of select="@txt_secondary_script"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:coords">
		<xsl:element name="Coords">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:point">
		<xsl:element name="Point">
			<xsl:attribute name="x">
				<xsl:value-of select="@x"/>
			</xsl:attribute>
			<xsl:attribute name="y">
				<xsl:value-of select="@y"/>
			</xsl:attribute>		
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:text_line">
		<xsl:element name="TextLine">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:word">
		<xsl:element name="Word">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:glyph">
		<xsl:element name="Glyph">

			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@ligature)!=0">
				<xsl:attribute name="ligature">
					<xsl:value-of select="@ligature"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@symbol)!=0">
				<xsl:attribute name="symbol">
					<xsl:value-of select="@symbol"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


	<xsl:template match="pc:image_region">
		<xsl:element name="ImageRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@img_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@img_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@img_colour_type)!=0">
				<xsl:attribute name="colourDepth">
					<xsl:choose>
						<xsl:when test="@img_colour_type='Black_And_White'">
							<xsl:text>bilevel</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='4_Bit_Greyscale'">
							<xsl:text>greyscale</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='8_Bit_Greyscale'">
							<xsl:text>greyscale</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='4_Bit_Colour'">
							<xsl:text>colour</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='8_Bit_Colour'">
							<xsl:text>colour</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='16_Bit_Colour'">
							<xsl:text>colour</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='24_Bit_Colour'">
							<xsl:text>colour</xsl:text>
						</xsl:when>
						<xsl:when test="@img_colour_type='32_Bit_Colour'">
							<xsl:text>colour</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@img_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@img_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@img_emb_text)!=0">
				<xsl:attribute name="embText">
					<xsl:choose>
						<xsl:when test="@img_emb_text='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@img_emb_text='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:line_drawing_region">
		<xsl:element name="LineDrawingRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@drwg_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@drwg_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@drwg_pen_colour)!=0">
				<xsl:attribute name="penColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@drwg_pen_colour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@drwg_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@drwg_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@drwg_emb_text)!=0">
				<xsl:attribute name="embText">
					<xsl:choose>
						<xsl:when test="@drwg_emb_text='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@drwg_emb_text='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="pc:graphic_region">
		<xsl:element name="GraphicRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@gfx_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@gfx_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@gfx_type)!=0">
				<xsl:attribute name="type">
					<xsl:choose>
						<xsl:when test="@gfx_type='Logo'">
							<xsl:text>logo</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Letterhead'">
							<xsl:text>letterhead</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Handwritten_Annotation'">
							<xsl:text>handwritten-annotation</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Stamp'">
							<xsl:text>stamp</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Signature'">
							<xsl:text>signature</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Paper_Grow'">
							<xsl:text>paper-grow</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Punch_Hole'">
							<xsl:text>punch-hole</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_type='Other'">
							<xsl:text>other</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@gfx_no_colours)!=0">
				<xsl:attribute name="numColours">
					<xsl:value-of select="@gfx_no_colours"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@gfx_emb_text)!=0">
				<xsl:attribute name="embText">
					<xsl:choose>
						<xsl:when test="@gfx_emb_text='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@gfx_emb_text='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="pc:table_region">
		<xsl:element name="TableRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@tbl_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@tbl_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_rows)!=0">
				<xsl:attribute name="rows">
					<xsl:value-of select="@tbl_rows"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_columns)!=0">
				<xsl:attribute name="columns">
					<xsl:value-of select="@tbl_columns"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_line_colour)!=0">
				<xsl:attribute name="lineColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@tbl_line_colour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@tbl_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_line_separators)!=0">
				<xsl:attribute name="lineSeparators">
					<xsl:choose>
						<xsl:when test="@tbl_line_separators='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@tbl_line_separators='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@tbl_emb_text)!=0">
				<xsl:attribute name="embText">
					<xsl:choose>
						<xsl:when test="@tbl_emb_text='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@tbl_emb_text='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	
	
	<xsl:template match="pc:chart_region">
		<xsl:element name="ChartRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@chart_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@chart_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@chart_type)!=0">
				<xsl:attribute name="type">
					<xsl:choose>
						<xsl:when test="@chart_type='Pie'">
							<xsl:text>pie</xsl:text>
						</xsl:when>
						<xsl:when test="@chart_type='Line'">
							<xsl:text>line</xsl:text>
						</xsl:when>
						<xsl:when test="@chart_type='Other'">
							<xsl:text>other</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@chart_no_colours)!=0">
				<xsl:attribute name="numColours">
					<xsl:value-of select="@chart_no_colours"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@chart_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@chart_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@chart_emb_text)!=0">
				<xsl:attribute name="embText">
					<xsl:choose>
						<xsl:when test="@chart_emb_text='Yes'">
							<xsl:text>true</xsl:text>
						</xsl:when>
						<xsl:when test="@chart_emb_text='No'">
							<xsl:text>false</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>	

	<xsl:template match="pc:separator_region">
		<xsl:element name="SeparatorRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@sep_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@sep_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@sep_colour)!=0">
				<xsl:attribute name="colour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@sep_colour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<!-- sep_bgcolour is not used anymore - ignore -->
			
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:maths_region">
		<xsl:element name="MathsRegion">
			<xsl:call-template name="HandleId"/>

			<xsl:if test="count(@maths_orientation)!=0">
				<xsl:attribute name="orientation">
					<xsl:value-of select="@maths_orientation"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="count(@maths_bgcolour)!=0">
				<xsl:attribute name="bgColour">
					<xsl:call-template name="mapColours">
						<xsl:with-param name="testVar">
							<xsl:value-of select="@maths_bgcolour"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
			</xsl:if>

			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:noise_region">
		<xsl:element name="NoiseRegion">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:frame_region">
		<xsl:element name="FrameRegion">
			<xsl:call-template name="HandleId"/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>


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

	<xsl:template name="mapColours">
		<xsl:param name="testVar"/>

		<xsl:choose>
			<xsl:when test="$testVar='Black'">
				<xsl:text>black</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Red'">
				<xsl:text>red</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='White'">
				<xsl:text>white</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Green'">
				<xsl:text>green</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Blue'">
				<xsl:text>blue</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Yellow'">
				<xsl:text>yellow</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Orange'">
				<xsl:text>orange</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Pink'">
				<xsl:text>pink</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Grey'">
				<xsl:text>grey</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Turquoise'">
				<xsl:text>turquoise</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Indigo'">
				<xsl:text>indigo</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Violet'">
				<xsl:text>violet</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Cyan'">
				<xsl:text>cyan</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Magenta'">
				<xsl:text>magenta</xsl:text>
			</xsl:when>
			<xsl:when test="$testVar='Brown'">
				<xsl:text>brown</xsl:text>
			</xsl:when>
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