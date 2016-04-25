<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:crosswalks="info:symplectic/crosswalks"
                exclude-result-prefixes="atom pubs crosswalks dim"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_config.xsl" />

    <xsl:import href="symplectic_xwalks_toolkit_formatted.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_fieldtypes.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_labels.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_mapping.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_processing.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_text.xsl" />

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$repository-type='dspace'">
                <dim:dim xmlns:dim="http://www.dspace.org/xmlns/dspace/dim">
                    <xsl:apply-templates />
                </dim:dim>
            </xsl:when>
            <xsl:when test="$repository-type='eprints'">
                <eprint xmlns:eprints="http://eprints.org/ep3/data/3.0">
                    <xsl:apply-templates />
                </eprint>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:variable name="crosswalk-datasource-precedences" select="node()" />

    <!-- Do not output anything for feed mode by default (can be overridden in user templates) -->
    <xsl:template match="text()" mode="feed" />

    <!-- Process the root node of a complete atom feed -->
    <xsl:template match="atom:feed">
        <!-- Apply templates across the entire feed, with mode="feed", to allow users to add their own mappings -->
        <!-- NB: The default template above will suppress output from all the nodes, except where overridden -->
        <xsl:apply-templates select="." mode="feed" />

        <!-- Output the standard xwalk mappings, by selecting an appropriate data source -->
        <xsl:apply-templates select="." mode="datasource" />

        <!-- Apply mapping options to fields supplied at an object level -->
        <xsl:apply-templates select="pubs:fields" />
        <!-- Apply mapping options to labels -->
        <xsl:apply-templates select="pubs:all-labels" />
    </xsl:template>
 <!--   
    <xsl:template match="pubs:organisational-details/pubs:group" mode="feed">
    <dim:dim mdschema="pubs" element="organisational-group" qualifier="">
        <!-- replaces '/' with blank space -->
        <!-- <xsl:value-of select="translate(., '/', ' ')" /> -->
    <!-- </dim:dim>
    </xsl:template>
    -->


    <!-- Select and output the mappings for a datasource, when supplied the full atom feed -->
    <xsl:template match="atom:feed" mode="datasource">
        <xsl:param name="position">1</xsl:param><!-- Count what position we're at in the prefences list -->

        <!-- Load the data source precedences configuration -->
        <xsl:variable name="_crosswalk-datasource-precedences" select="$crosswalk-datasource-precedences/crosswalks:datasource-precedence" />

        <xsl:choose>
            <!-- If preferences have been defined, or we've not found a preferred data source -->
            <xsl:when test="$_crosswalk-datasource-precedences and $_crosswalk-datasource-precedences[$position]">
                <xsl:choose>
                    <!-- Output mappings for this data source, if it is the "most preferred" selection -->
                    <xsl:when test="atom:entry[pubs:data-source/pubs:source-name=string($_crosswalk-datasource-precedences[$position])]">
                        <xsl:apply-templates select="atom:entry[pubs:data-source/pubs:source-name=string($_crosswalk-datasource-precedences[$position])][1]/pubs:bibliographic-data/pubs:native" />
                    </xsl:when>
                    <!-- special cases for manual == manual-entry -->
                    <xsl:when test="$_crosswalk-datasource-precedences[$position]='manual' and atom:entry[pubs:data-source/pubs:source-name='manual-entry']">
                        <xsl:apply-templates select="atom:entry[pubs:data-source/pubs:source-name='manual-entry'][1]/pubs:bibliographic-data/pubs:native" />
                    </xsl:when>
                    <xsl:when test="$_crosswalk-datasource-precedences[$position]='manual-entry' and atom:entry[pubs:data-source/pubs:source-name='manual']">
                        <xsl:apply-templates select="atom:entry[pubs:data-source/pubs:source-name='manual'][1]/pubs:bibliographic-data/pubs:native" />
                    </xsl:when>
                    <!-- special cases for wos == web-of-science -->
                    <xsl:when test="$_crosswalk-datasource-precedences[$position]='web-of-science' and atom:entry[pubs:data-source/pubs:source-name='wos']">
                        <xsl:apply-templates select="atom:entry[pubs:data-source/pubs:source-name='wos'][1]/pubs:bibliographic-data/pubs:native" />
                    </xsl:when>
                    <xsl:when test="$_crosswalk-datasource-precedences[$position]='wos' and atom:entry[pubs:data-source/pubs:source-name='web-of-science']">
                        <xsl:apply-templates select="atom:entry[pubs:data-source/pubs:source-name='web-of-science'][1]/pubs:bibliographic-data/pubs:native" />
                    </xsl:when>
                    <!-- current "preferred data source" not found, move on to the next preference -->
                    <xsl:otherwise>
                            <xsl:apply-templates select="." mode="datasource"><xsl:with-param name="position" select="$position+1" /></xsl:apply-templates>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- No preferences given, so choose the first data source -->
            <xsl:otherwise>
                <xsl:apply-templates select="atom:entry[1]/pubs:bibliographic-data/pubs:native" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="pubs:bibliographic-data" />

    <xsl:template match="pubs:native">
        <!-- Call the mappings processor, with the user supplied mappings -->
        <xsl:if test="$crosswalk-mappings and $crosswalk-mappings/*">
            <xsl:call-template name="_process_mappings">
                <xsl:with-param name="mappings" select="$crosswalk-mappings/*" />
                <xsl:with-param name="first-mapped-only" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:fields">
        <!-- Call the mappings processor, with the user supplied mappings -->
        <xsl:if test="$crosswalk-object-mappings and $crosswalk-object-mappings/*">
            <xsl:call-template name="_process_mappings">
                <xsl:with-param name="mappings" select="$crosswalk-object-mappings/*" />
                <xsl:with-param name="first-mapped-only" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:all-labels">
        <xsl:if test="$crosswalk-label-mappings and $crosswalk-label-mappings/*">
            <xsl:for-each select="pubs:keywords">
                <xsl:call-template name="_process_label_mappings">
                    <xsl:with-param name="nodes" select="/.." />
                    <xsl:with-param name="mappings" select="$crosswalk-label-mappings/*" />
                </xsl:call-template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="map_fields">
        <xsl:param name="elements" />
        <xsl:param name="dspace" />
        <xsl:param name="eprints" />

        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:variable name="repo_field">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:value-of select="$dspace" /></xsl:when>
                <xsl:when test="$repository-type='eprints'"><xsl:value-of select="$eprints" /></xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="_map_fields">
            <xsl:with-param name="elements"    select="$elements" />
            <xsl:with-param name="repo_field"  select="$repo_field" />
            <xsl:with-param name="date-format" select="$date-format" />
            <xsl:with-param name="max"         select="$max" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="create_list">
        <xsl:param name="elements" />
        <xsl:param name="dspace" />
        <xsl:param name="eprints" />

        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:variable name="repo_field">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:value-of select="$dspace" /></xsl:when>
                <xsl:when test="$repository-type='eprints'"><xsl:value-of select="$eprints" /></xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="_create_list">
            <xsl:with-param name="elements"       select="$elements" />
            <xsl:with-param name="repo_field"     select="$repo_field" />
            <xsl:with-param name="list-separator" select="$list-separator" />
            <xsl:with-param name="date-format"    select="$date-format" />
            <xsl:with-param name="max"            select="$max" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="create_formatted">
        <xsl:param name="template" />
        <xsl:param name="dspace" />
        <xsl:param name="eprints" />

        <xsl:param name="field-start" />
        <xsl:param name="field-end" />
        <xsl:param name="field-wrap-start" />
        <xsl:param name="field-wrap-end" />

        <xsl:variable name="repo_field">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:value-of select="$dspace" /></xsl:when>
                <xsl:when test="$repository-type='eprints'"><xsl:value-of select="$eprints" /></xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="_create_formatted">
            <xsl:with-param name="template"         select="$template" />
            <xsl:with-param name="repo_field"       select="$repo_field" />
            <xsl:with-param name="field-start"      select="$field-start" />
            <xsl:with-param name="field-end"        select="$field-end" />
            <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
            <xsl:with-param name="field-wrap-end"   select="$field-wrap-end" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="create_text">
        <xsl:param name="text" />
        <xsl:param name="dspace" />
        <xsl:param name="eprints" />

        <xsl:variable name="repo_field">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:value-of select="$dspace" /></xsl:when>
                <xsl:when test="$repository-type='eprints'"><xsl:value-of select="$eprints" /></xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="_create_text">
            <xsl:with-param name="text" select="$text" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
