<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright PRImA Research 2014, Stefan Pletschacher, Christian Clausner -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pc="http://schema.primaresearch.org/PAGE/gts/pagecontent/2013-07-15"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns="http://www.w3.org/2000/svg">

	<xsl:template match="pc:PcGts">

		<xsl:element name="svg" namespace="http://www.w3.org/2000/svg">
			<xsl:attribute name="id">
				<xsl:text>SVGRootID</xsl:text>
			</xsl:attribute>
			
			<xsl:if test="$dispMode!='static'">
				<xsl:attribute name="onload">
					<xsl:text>init()</xsl:text>
				</xsl:attribute>
			</xsl:if>
			
			<xsl:choose>
				<xsl:when test="$dispMode='static'">
					<xsl:attribute name="width">
						<xsl:text>100%</xsl:text>
						<!-- <xsl:value-of select="pc:Page/@imageWidth"/> -->
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:text>100%</xsl:text>
						<!-- <xsl:value-of select="pc:Page/@imageHeight"/> -->
					</xsl:attribute>
					<xsl:attribute name="viewBox">
						<xsl:text>0 0 </xsl:text>
						<xsl:value-of select="pc:Page/@imageWidth"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="pc:Page/@imageHeight"/>
					</xsl:attribute>
					
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="width">
						<xsl:value-of select="$svgWidth"/>
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$svgHeight"/>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:if test="$dispMode='static'">	
				<!-- Embed external stylesheet -->
				<xsl:if test="$embExt='true'">
					<xsl:element name="style">
						<xsl:attribute name="type">text/css</xsl:attribute>
						<xsl:value-of select="document($cssEmb)"/>
					</xsl:element>
				</xsl:if>
			</xsl:if>

			<xsl:if test="$dispMode='interactive'">	
				<!-- Link to an external script -->
				<xsl:if test="$embExt='false'">
					<xsl:element name="script">
						<xsl:attribute name="xlink:href">
							<xsl:value-of select="$scripts"/>
						</xsl:attribute>
						<xsl:attribute name="type">text/ecmascript</xsl:attribute>
					</xsl:element>
				</xsl:if>

				<!-- Embed js and css -->
				<xsl:if test="$embExt='true'">
					<xsl:element name="style">
						<xsl:attribute name="type">text/css</xsl:attribute>
						<xsl:value-of select="document($cssEmb)"/>
					</xsl:element>
					<xsl:element name="script">
						<xsl:attribute name="type">text/ecmascript</xsl:attribute>
						<xsl:value-of select="document($jsEmb)"/>
					</xsl:element>
				</xsl:if>

				<!-- The following would require XSLT 2.0!
				<xsl:if test="$embExt!='false'">
					<xsl:element name="script">
						<xsl:attribute name="type">text/ecmascript</xsl:attribute>
						<xsl:value-of select="unparsed-text($jsEmb)" disable-output-escaping="yes"/>
					</xsl:element>
					<xsl:element name="style">
						<xsl:attribute name="type">text/css</xsl:attribute>
						<xsl:value-of select="unparsed-text($cssEmb)" disable-output-escaping="yes"/>
					</xsl:element>
				</xsl:if>
 				-->
 				
				<xsl:element name="metadata">
					<xsl:attribute name="id">
						<xsl:text>DocMetadataID</xsl:text>
					</xsl:attribute>
				
					<xsl:element name="pc:DocID">
						<xsl:value-of select="@pcGtsId"/>
					</xsl:element>
					<xsl:element name="pc:Creator">
						<xsl:value-of select="pc:Metadata/pc:Creator"/>
					</xsl:element>
					<xsl:element name="pc:Created">
						<xsl:value-of select="pc:Metadata/pc:Created"/>
					</xsl:element>
					<xsl:element name="pc:LastChange">
						<xsl:value-of select="pc:Metadata/pc:LastChange"/>
					</xsl:element>
					<xsl:element name="pc:Comments">
						<xsl:value-of select="pc:Metadata/pc:Comments"/>
					</xsl:element>
				</xsl:element>

				<xsl:element name="g">
					<xsl:attribute name="id">TopInfoBoxID</xsl:attribute>
				</xsl:element>
	
				<xsl:element name="g">
					<xsl:attribute name="id">LeftInfoBoxID</xsl:attribute>
				</xsl:element>
			</xsl:if>

			<xsl:element name="svg">
				<xsl:attribute name="id">ContentBoxID</xsl:attribute>

				<xsl:choose>
					<xsl:when test="$dispMode='static'">
						<xsl:attribute name="x">0</xsl:attribute>
						<xsl:attribute name="y">0</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:value-of select="pc:Page/@imageWidth"/>
						</xsl:attribute>
						<xsl:attribute name="height">
							<xsl:value-of select="pc:Page/@imageHeight"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="x">
							<xsl:value-of select="$contentBoxXPos"/>
						</xsl:attribute>
						<xsl:attribute name="y">
							<xsl:value-of select="$contentBoxYPos"/>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:value-of select="$contentBoxWidth"/>
						</xsl:attribute>
						<xsl:attribute name="height">
							<xsl:value-of select="$contentBoxHeight"/>
						</xsl:attribute>				
						<xsl:attribute name="viewBox">
							<xsl:text>0 0 </xsl:text>
							<xsl:value-of select="pc:Page/@imageWidth"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="pc:Page/@imageHeight"/>
						</xsl:attribute>				
					</xsl:otherwise>
				</xsl:choose>

				<!--  Background image -->
				<xsl:element name="image">
					<xsl:attribute name="id">BgImageID</xsl:attribute>
					<xsl:attribute name="x">0</xsl:attribute>
					<xsl:attribute name="y">0</xsl:attribute>
	
					<xsl:attribute name="width">
						<xsl:value-of select="pc:Page/@imageWidth"/>
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="pc:Page/@imageHeight"/>
					</xsl:attribute>

					<xsl:choose>
						<xsl:when test="$forcedBgImg!='false'">
							<xsl:attribute name="xlink:href">
								<xsl:value-of select="$forcedBgImg"/>
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="xlink:href">
								<xsl:value-of select="concat(substring-before(pc:Page/@imageFilename,'.tif'),$bgImageExtension)"/>
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>

				<xsl:apply-templates/>
			</xsl:element>			

			<xsl:if test="$dispMode!='static'">
				<!-- Controls for panning and zooming -->
				<xsl:element name="svg">
					<xsl:attribute name="id">ControlBoxID</xsl:attribute>
					<xsl:attribute name="x">
						<xsl:value-of select="$controlBoxXPos"/>
					</xsl:attribute>
					<xsl:attribute name="y">
						<xsl:value-of select="$controlBoxYPos"/>
					</xsl:attribute>
					<xsl:attribute name="width">
						<xsl:value-of select="$controlBoxWidth"/>
					</xsl:attribute>
					<xsl:attribute name="height">
						<xsl:value-of select="$controlBoxHeight"/>
					</xsl:attribute>

					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Pan</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ArrowLeftID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,7 6,0 6,5 14,4 14,10 6,9 6,14</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(10 23)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('left')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Pan</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ResetPanningID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,0 8,0 8,8 0,8</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(27 26)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('resetPan')</xsl:attribute>
					</xsl:element>
					
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Pan</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ArrowRightID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,4 8,5 8,0 14,7 8,14 8,9 0,10</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(38 23)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('right')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Pan</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ArrowDownID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,8 5,8 4,0 10,0 9,8 14,8 7,14</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(24 37)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('down')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Pan</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ArrowUpID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,6 7,0 14,6 9,6 10,14 4,14 5,6</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(24 9)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('up')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Zoom</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ZoomInID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>6,6 6,0 12,0 12,6 18,6 18,12 12,12 12,18 6,18 6,12 0,12 0,6</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(69 21)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('in')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Zoom</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ResetZoomID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,0 8,0 8,8 0,8</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(91 26)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('resetZoom')</xsl:attribute>
					</xsl:element>
	
					<xsl:element name="polygon">
						<xsl:attribute name="class">
							<xsl:text>Zoom</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="id">
							<xsl:text>ZoomOutID</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="points">
							<xsl:text>0,0 18,0 18,6 0,6</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="transform">
							<xsl:text>translate(103 27)</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">panAndZoom('out')</xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>

	<xsl:template match="pc:Page">
			<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:Border">
		<xsl:if test="$dispLevel='all' or $dispLevel='border'">
			<xsl:call-template name="pc:simplePolygon">
				<xsl:with-param name="polygonType">Border</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:PrintSpace">
		<xsl:if test="$dispLevel='all' or $dispLevel='printspace'">
			<xsl:call-template name="pc:simplePolygon">
				<xsl:with-param name="polygonType">PrintSpace</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:TextRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>TextRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
	 				<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
				
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
							<xsl:element name="pc:Text">
								<xsl:value-of select="pc:TextEquiv/pc:PlainText"/>
							</xsl:element>
							<xsl:element name="pc:Unicode">
								<xsl:value-of select="pc:TextEquiv/pc:Unicode"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:TextLine">
		<xsl:if test="$dispLevel='all' or $dispLevel='textlines'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>TextLine</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
	 				<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
				
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
							<xsl:element name="pc:Text">
								<xsl:value-of select="pc:TextEquiv/pc:PlainText"/>
							</xsl:element>
							<xsl:element name="pc:Unicode">
								<xsl:value-of select="pc:TextEquiv/pc:Unicode"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:Word">
		<xsl:if test="$dispLevel='all' or $dispLevel='words'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>Word</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
	 				<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>			
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
				
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
							<xsl:element name="pc:Text">
								<xsl:value-of select="pc:TextEquiv/pc:PlainText"/>
							</xsl:element>
							<xsl:element name="pc:Unicode">
								<xsl:value-of select="pc:TextEquiv/pc:Unicode"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:Glyph">
		<xsl:if test="$dispLevel='all' or $dispLevel='glyphs'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>Glyph</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
	 				<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
				
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
							<xsl:element name="pc:Text">
								<xsl:value-of select="pc:TextEquiv/pc:PlainText"/>
							</xsl:element>
							<xsl:element name="pc:Unicode">
								<xsl:value-of select="pc:TextEquiv/pc:Unicode"/>
							</xsl:element>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:ImageRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>ImageRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:LineDrawingRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>LineDrawingRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:GraphicRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>GraphicRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:TableRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>TableRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:ChartRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>ChartRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:SeparatorRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>SeparatorRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:MathsRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>MathsRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:NoiseRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>NoiseRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:AdvertRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>AdvertRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="pc:ChemRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>ChemRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="pc:MusicRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>MusicRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="pc:UnknownRegion">
		<xsl:if test="$dispLevel='all' or $dispLevel='regions'">
			<xsl:element name="polygon">
				<xsl:attribute name="class">
					<xsl:text>UnknownRegion</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="id">
					<xsl:text>p-</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:if test="$dispMode!='static'">
					<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="points">
					<xsl:value-of select="pc:Coords/@points"/>
				</xsl:attribute>
	
				<xsl:if test="$dispMode!='static'">
					<xsl:element name="metadata">
						<xsl:element name="pc:RegionInfo">
							<xsl:for-each select="@*">
								<xsl:attribute name="pc:{name()}">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</xsl:for-each>
						</xsl:element>
					</xsl:element>
				</xsl:if>
			</xsl:element>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="pc:simplePolygon">
		<xsl:param name="polygonType"/>

		<xsl:element name="polygon">
			<xsl:attribute name="class">
				<xsl:value-of select="$polygonType"/>
			</xsl:attribute>
			<xsl:if test="$dispMode!='static'">
				<xsl:attribute name="onclick">regionClicked(evt)</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="points">
				<xsl:value-of select="pc:Coords/@points"/>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>		

</xsl:stylesheet>