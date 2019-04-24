<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" exclude-result-prefixes="xs"
    xmlns:doc="http://www.lyncode.com/xoai"
    version="1.0">
    <xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />
    <xsl:template match="/">
        <mdRecord xmlns="http://dplava.lib.virginia.edu"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:dcterms="http://purl.org/dc/terms/"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:edm="http://www.europeana.eu/schemas/edm/"
            xsi:schemaLocation="http://dplava.lib.virginia.edu dplava.xsd">
            
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
                <dcterms:title>
                    <xsl:value-of select="." />
                </dcterms:title>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='creator']/doc:element/doc:field[@name='value']">
                <dcterms:creator>
                    <xsl:value-of select="." />
                </dcterms:creator>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
                <dcterms:creator>
                    <xsl:value-of select="." />
                </dcterms:creator>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name!='author']/doc:element">
                <dcterms:contributor>
                    <xsl:value-of select="doc:field[@name='value'][1]" />
                </dcterms:contributor> <!-- contributor [2] is the dept that no longer exist -->
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
                <dcterms:subject>
                    <xsl:value-of select="." />
                </dcterms:subject>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='abstract']/doc:element/doc:field[@name='value']">
                <dcterms:description> <!-- changed from dcterms:abstract -->
                    <xsl:value-of select="." />
                </dcterms:description>
            </xsl:for-each>
            <!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
                <dcterms:dateAccepted>
                    <xsl:value-of select="." />
                </dcterms:dateAccepted>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
                <dcterms:available>
                    <xsl:value-of select="." />
                </dcterms:available>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
                <dcterms:created>
                    <xsl:value-of select="." />
                </dcterms:created>
            </xsl:for-each> -->
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
                <dcterms:issued>
                    <xsl:value-of select="." />
                </dcterms:issued>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
                <edm:hasType>
                    <xsl:value-of select="." />
                </edm:hasType>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:identifier>
                    <xsl:value-of select="." />
                </dcterms:identifier>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:language>
                    <xsl:value-of select="." />
                </dcterms:language>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:relation>
                    <xsl:value-of select="." />
                </dcterms:relation>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element/doc:field[@name='value']">
                <dcterms:relation>
                    <xsl:value-of select="." />
                </dcterms:relation>
            </xsl:for-each>
            <!-- 12/20 commented out because we only need rights [1] <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:rights>
                    <xsl:value-of select="." />
                </dcterms:rights>
            </xsl:for-each>-->
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element">
                <dcterms:rights>
                    <xsl:value-of select="doc:field[@name='value'][1]" /> <!-- capturing only standardized rights, check if this works -->
                </dcterms:rights>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
                <dcterms:format>
                    <xsl:value-of select="." />
                </dcterms:format>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:field[@name='value']">
                <dcterms:coverage>
                    <xsl:value-of select="." />
                </dcterms:coverage>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:coverage>
                    <xsl:value-of select="." />
                </dcterms:coverage>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
                <dcterms:publisher>
                    <xsl:value-of select="." />
                </dcterms:publisher>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:publisher>
                    <xsl:value-of select="." />
                </dcterms:publisher>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:field[@name='value']">
                <dcterms:source>
                    <xsl:value-of select="." />
                </dcterms:source>
            </xsl:for-each>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='source']/doc:element/doc:element/doc:field[@name='value']">
                <dcterms:source>
                    <xsl:value-of select="." />
                </dcterms:source>
            </xsl:for-each>
            
            <!-- this shows "http://hdl.handle.net/10919/10203" -->
            <edm:isShownAt><xsl:value-of select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']"></xsl:value-of></edm:isShownAt> <!-- IGNORE, deleted: if this doesn't work, use whole "http://hdl.handle.net/10919/10203" by removing [@name='uri'] and /text() above -->
            
            <!-- to continue from here 12/6 --> <!-- continued 12/20 -->
            
            <!-- if the item is "THUMBNAIL", then take the URL value of it !!!not sure if this work because the thumbnail URL appears before the "THUMBNAIL"-->
            <xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:element[@name='bitstreams']/doc:element[@name='bitstream']">
                <xsl:if test="../../doc:field[@name='name']/text() = 'THUMBNAIL'">
            <edm:preview>
                <xsl:value-of select="doc:field[@name='url']/text()"></xsl:value-of>
            </edm:preview>
                </xsl:if>
            </xsl:for-each>
            
            <!-- commented out because this woulnd't work <xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']">
            <xsl:if test="doc:field[@name='name']/text() = 'THUMBNAIL'">
                <edm:preview><xsl:value-of select="doc:field[@name='format']/text()"></xsl:value-of>
                </edm:preview>
                -->
            
            <!-- second experiment we can run is to point to 4th description and pic the URL--> <!-- have to use [4] as it's embedded in the link, checked 26 items, they are consistent [4] refers to the thumbnails -->
                            <!--<edm:preview><xsl:value-of select="rdf:Description[4]/@rdf:about"/>http://di.lib.vt.edu/files/square_thumbnails/1/<xsl:value-of
                select="rdf:Description/dcterms:identifier"/>/<xsl:value-of select="rdf:Description/dcterms:identifier"/>_0001.jpg</edm:preview>-->
            <!--collection identifier 1 for Barter Collection-->
        </mdRecord>
    </xsl:template>
</xsl:stylesheet>