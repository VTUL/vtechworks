<?xml version="1.0" encoding="UTF-8" ?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <jmelo@lyncode.com>
	
	> http://www.openarchives.org/OAI/2.0/oai_dc.xsd

 -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:doc="http://www.lyncode.com/xoai"
	version="1.0">
	<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />
	
	<xsl:template match="/">
		<qdc:qualifieddc xmlns:qdc="http://dspace.org/qualifieddc/"
				xmlns:dc="http://purl.org/dc/elements/1.1/"
				xmlns:dcterms="http://purl.org/dc/terms/"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://purl.org/dc/elements/1.1/ http://dublincore.org/schemas/xmls/qdc/2006/01/06/dc.xsd http://purl.org/dc/terms/ http://dublincore.org/schemas/xmls/qdc/2006/01/06/dcterms.xsd http://dspace.org/qualifieddc/ http://www.ukoln.ac.uk/metadata/dcmi/xmlschema/qualifieddc.xsd">
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
				<dc:title><xsl:value-of select="." /></dc:title>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element[@name='alternative']/doc:element/doc:field[@name='value']">
				<dcterms:alternative><xsl:value-of select="." /></dcterms:alternative>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
				<dc:creator>
					<xsl:value-of select="." />
				</dc:creator>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
				<dc:creator>
					<xsl:value-of select="." />
				</dc:creator>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='inventor']/doc:element/doc:field[@name='value']">
				<dc:creator>
					<xsl:value-of select="." />
				</dc:creator>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='photographer']/doc:element/doc:field[@name='value']">
				<dc:creator>
					<xsl:value-of select="." />
				</dc:creator>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
				<dcterms:available>
					<xsl:value-of select="." />
				</dcterms:available>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
				<dcterms:issued>
					<xsl:value-of select="." />
				</dcterms:issued>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='abstract']/doc:element/doc:field[@name='value']">
				<dcterms:abstract>
					<xsl:value-of select="." />
				</dcterms:abstract>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='tableofcontents']/doc:element/doc:field[@name='value']">
				<dcterms:tableOfContents>
					<xsl:value-of select="." />
				</dcterms:tableOfContents>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='format']/doc:element[@name='extent']/doc:element/doc:field[@name='value']">
				<dcterms:extent>
					<xsl:value-of select="." />
				</dcterms:extent>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='citation']/doc:element/doc:field[@name='value']">
				<dcterms:bibliographicCitation>
					<xsl:value-of select="." />
				</dcterms:bibliographicCitation>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='doi']">
				<dc:identifier>
					doi:<xsl:value-of select="substring-after(doc:element/doc:field[@name='value'],'https://doi.org')" />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='eissn']/doc:element/doc:field[@name='value']">
				<dc:identifier>
					EISSN:<xsl:value-of select="." />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='isbn']/doc:element/doc:field[@name='value']">
				<dc:identifier>
					ISBN:<xsl:value-of select="." />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='issn']/doc:element/doc:field[@name='value']">
				<dc:identifier>
					ISSN:<xsl:value-of select="." />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='patentnumber']/doc:element/doc:field[@name='value']">
				<dc:identifier>
					USPN:<xsl:value-of select="." />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
				<dc:identifier>
					<xsl:value-of select="." />
				</dc:identifier>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:field[@name='value']">
				<dc:language>
					<xsl:value-of select="." />
				</dc:language>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
				<dc:language>
					<xsl:value-of select="." />
				</dc:language>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
				<dc:publisher>
					<xsl:value-of select="." />
				</dc:publisher>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='ispartof']/doc:element/doc:field[@name='value']">
				<dcterms:isPartOf>
					<xsl:value-of select="." />
				</dcterms:isPartOf>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='ispartofseries']/doc:element/doc:field[@name='value']">
				<dcterms:isPartOf>
					<xsl:value-of select="." />
				</dcterms:isPartOf>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element[@name='serial']/doc:element/doc:field[@name='value']">
				<dcterms:isPartOf>
					<xsl:value-of select="." />
				</dcterms:isPartOf>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
				<dc:rights>
					<xsl:value-of select="." />
				</dc:rights>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='cabt']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='cpc']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='lcsh']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='mesh']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='other']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='uspc']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element[@name='uspcother']/doc:element/doc:field[@name='value']">
				<dc:subject>
					<xsl:value-of select="." />
				</dc:subject>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
				<dc:type>
					<xsl:value-of select="." />
				</dc:type>
			</xsl:for-each>
			<xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']">
				<xsl:if test="doc:field[@name='name']/text() = 'THUMBNAIL'">
					<dcterms:isVersionOf>
						<xsl:value-of select="doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='url']" />
					</dcterms:isVersionOf>
				</xsl:if>
			</xsl:for-each>
		</qdc:qualifieddc>
	</xsl:template>
</xsl:stylesheet>
