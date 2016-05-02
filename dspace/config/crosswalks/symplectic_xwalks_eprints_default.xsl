<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:crosswalks="info:symplectic/crosswalks"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                exclude-result-prefixes="atom pubs crosswalks"
                version="1.0">
    <!-- Required for all crosswalks - import the standard toolkit -->
    <xsl:import href="symplectic_xwalks_toolkit.xsl" />

    <!-- Required for all crosswalks - load the data islands from the crosswalk stylesheet -->
    <xsl:variable name="crosswalk-mappings" select="document('')//crosswalks:mappings" />
    <xsl:variable name="crosswalk-object-mappings" select="document('')//crosswalks:object-mappings" />
    <!-- xsl:variable name="crosswalk-label-mappings" select="document('')//crosswalks:label-mappings" / -->
    <xsl:variable name="crosswalk-dictionaries" select="document('')//crosswalks:dictionaries" />
    <xsl:variable name="crosswalk-datasource-precedences" select="document('')//crosswalks:datasource-precedences" />

    <!--
        Data Source Mappings
        ====================
        Map values from the data source into repository fields
    -->
    <crosswalks:mappings for="eprints">
        <!-- Default mappings -->
        <crosswalks:mapping eprints="abstract"     elements="abstract" />
        <crosswalks:mapping eprints="creators"     elements="authors" />
        <crosswalks:mapping eprints="id_number"    elements="doi" />
        <crosswalks:mapping eprints="editors"      elements="editors" />
        <crosswalks:mapping eprints="eissn"        elements="eissn" />
        <crosswalks:mapping eprints="isbn"         elements="isbn-10,isbn-13" />
        <crosswalks:mapping eprints="ispublished"  elements="publication-status" />
        <crosswalks:mapping eprints="issn"         elements="issn" />
        <crosswalks:mapping eprints="language"     elements="language" />
        <crosswalks:mapping eprints="location"     elements="location" />
        <crosswalks:mapping eprints="number"       elements="issue" />
        <crosswalks:mapping eprints="official_url" elements="publisher-url" />
        <crosswalks:mapping eprints="pagerange"    elements="pagination" />
        <crosswalks:mapping eprints="publication"  elements="journal" />
        <crosswalks:mapping eprints="publisher"    elements="publisher" />
        <crosswalks:mapping eprints="related_url" if-elements="author-url">
            <crosswalks:mapping eprints="url"  elements="author-url" />
            <crosswalks:mapping eprints="type" text="author" />
        </crosswalks:mapping>
        <crosswalks:mapping eprints="source"   elements="name-of-conference" />
        <crosswalks:mapping eprints="subjects" elements="keywords" />
        <crosswalks:mapping eprints="title"    elements="title" />
        <crosswalks:mapping eprints="volume"   elements="volume" />

        <crosswalks:mapping first-mapped-only="y">
            <crosswalks:mapping if-elements="filed-date">
                <crosswalks:mapping eprints="date"            elements="filed-date" />
                <crosswalks:mapping eprints="date_type"       text="filed" />
            </crosswalks:mapping>
            <crosswalks:mapping if-elements="publication-date">
                <crosswalks:mapping eprints="date"            elements="publication-date" />
                <crosswalks:mapping eprints="date_type"       text="published" />
            </crosswalks:mapping>
        </crosswalks:mapping>
    </crosswalks:mappings>

    <!--
        Object level field mappings
        ===========================
        Map values from the publication fields into repository fields
    -->
    <crosswalks:object-mappings for="eprints">
        <crosswalks:mapping eprints="note"        elements="p-requested-embargo-period" />
        <!--
            These mappings are for the OA location selection
        <crosswalks:mapping eprints="note" elements="fulltext-comment" />
            <crosswalks:mapping if-elements="acceptance-date">
                <crosswalks:mapping eprints="date"            elements="acceptance-date" />
                <crosswalks:mapping eprints="date_type"       text="published" />
            </crosswalks:mapping>
            <crosswalks:mapping eprints="related_url" if-elements="p-oa-location">
                <crosswalks:mapping eprints="url"  elements="p-oa-location" />
                <crosswalks:mapping eprints="type" text="pub" />
            </crosswalks:mapping>
            <crosswalks:mapping dspace="note" elements="p-oa-location-file-version" />
        -->
    </crosswalks:object-mappings>

    <!--
        Label mappings
        ==============
    -->
    <!--
        <crosswalks:label-mappings for="eprints">
            <crosswalks:label-mapping eprints="subjects" list-separator=", ">
                <crosswalks:label-mapping origin="issn-inferred" />
                <crosswalks:label-mapping exclude-scheme="for" />
            </crosswalks:label-mapping>
            <crosswalks:label-mapping eprints="subjects" list-separator="; ">
                <crosswalks:label-mapping exclude-scheme="for" />
            </crosswalks:label-mapping>
            <crosswalks:label-mapping eprints="subjects" />
        </crosswalks:label-mappings>
    -->

    <!--
        Data Dictionaries
        =================
        Convert values supplied by Elements to values used in EPrints
    -->
    <crosswalks:dictionaries>
        <crosswalks:dictionary elements="publication-status">
            <crosswalks:entry elements="Published"      eprints="pub" />
            <crosswalks:entry elements="Submitted"      eprints="submitted" />
            <crosswalks:entry elements="Accepted"       eprints="inpress" />
            <crosswalks:entry elements="Unpublished"    eprints="unpub" />
        </crosswalks:dictionary>
    </crosswalks:dictionaries>

    <!--
        Data Source Precedences
        =======================
        Used when passing the full atom feed from Repository Tools.
        Please check your Elements instance to see what data sources are being used.
        Only data sources listed here will be considered for mapping.
    -->
    <crosswalks:datasource-precedences>
        <crosswalks:datasource-precedence>web-of-science</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>wos-lite</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>pubmed</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>isi-precedings</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>manual-entry</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>arxiv</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>dblp</crosswalks:datasource-precedence>
        <crosswalks:datasource-precedence>scopus</crosswalks:datasource-precedence>
    </crosswalks:datasource-precedences>

    <!--
        Add publication type mappings
    -->
    <xsl:template match="/atom:feed">
        <xsl:choose>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/artefact'"><type>artefact</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/book'"><type>book</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/chapter'"><type>book_section</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/composition'"><type>composition</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/conference-proceeding'"><type>conference_item</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/dataset'"><type>dataset</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/exhibition'"><type>exhibition</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/journal-article'"><type>article</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/multimedia'"><type>video</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/patent'"><type>patent</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/performance'"><type>performance</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/report'"><type>other</type></xsl:when>
            <xsl:when test="atom:category/@term='http://www.symplectic.co.uk/publications/atom-terms/1.0/thesis-or-dissertation'"><type>thesis</type></xsl:when>
            <xsl:otherwise><type>other</type></xsl:otherwise>
        </xsl:choose>
        <xsl:apply-imports />
    </xsl:template>
</xsl:stylesheet>
