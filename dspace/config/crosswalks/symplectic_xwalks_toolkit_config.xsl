<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:crosswalks="info:symplectic/crosswalks" xmlns:epconfig="http://www.symplectic.co.uk/ep3/config" exclude-result-prefixes="crosswalks epconfig" version="1.0">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:variable name="default-field-start">[$</xsl:variable>
    <xsl:variable name="default-field-end">]</xsl:variable>
    <xsl:variable name="default-field-wrap-start">~</xsl:variable>
    <xsl:variable name="default-field-wrap-end">~</xsl:variable>

    <xsl:variable name="default-list-separator">; </xsl:variable>

    <!--
        Language to use for DSpace metadata
    -->
    <xsl:variable name="default-lang">en_US</xsl:variable>

    <!--
        Only use the EPrints configuration file if the repository-type is 'eprints'
    -->
    <xsl:variable name="config-eprints-file">symplectic_xwalks_toolkit_config_eprints.xml</xsl:variable>
    <xsl:variable name="config-eprints" select="document($config-eprints-file)[$repository-type='eprints']"/>
    <xsl:variable name="config-eprints-fields" select="$config-eprints//epconfig:fields" />

    <xsl:variable name="config-eprints-pagerange-field" /> <!-- pagerange -->
    <xsl:variable name="config-eprints-pages-field" /> <!-- pages -->

    <xsl:variable name="repository-type">
        <xsl:choose>
            <xsl:when test="string($crosswalk-mappings/@for)='dspace'"><xsl:text>dspace</xsl:text></xsl:when>
            <xsl:when test="string($crosswalk-mappings/@for)='eprints'"><xsl:text>eprints</xsl:text></xsl:when>
            <xsl:when test="count($crosswalk-mappings//@dspace) &gt; count($crosswalk-mappings//@eprints)">
                <xsl:text>dspace</xsl:text>
            </xsl:when>
            <xsl:when test="count($crosswalk-mappings//@eprints) &gt; count($crosswalk-mappings//@dspace)">
                <xsl:text>eprints</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>

    <!-- These settings should be copied to your mapping implementation -->
    <xsl:variable name="crosswalk-mappings" select="document('')//crosswalks:mappings" />
    <xsl:variable name="crosswalk-object-mappings" select="document('')//crosswalks:object-mappings" />
    <xsl:variable name="crosswalk-label-mappings" select="document('')//crosswalks:label-mappings" />
</xsl:stylesheet>
