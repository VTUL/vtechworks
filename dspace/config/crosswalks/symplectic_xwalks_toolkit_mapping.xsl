<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                exclude-result-prefixes="pubs dim"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_mapping_fieldtypes.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_list.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_utils.xsl" />

    <xsl:template name="_map_fields">
        <xsl:param name="elements" />
        <xsl:param name="repo_field" />

        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:variable name="_max">
            <xsl:choose>
                <xsl:when test="$repository-type='eprints'">
                    <xsl:choose>
                        <xsl:when test="boolean($config-eprints-fields/*[@name=$repo_field]/@multiple)"><xsl:value-of select="$max" /></xsl:when>
                        <xsl:otherwise><xsl:text>1</xsl:text></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="$max" /></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="_render_field_mapping">
            <xsl:with-param name="field" select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_mapping_occurrences">
                    <xsl:with-param name="elements"    select="$elements" />
                    <xsl:with-param name="repo_field"  select="$repo_field" />
                    <xsl:with-param name="date-format" select="$date-format" />
                    <xsl:with-param name="max"         select="$_max" />
                    <xsl:with-param name="_elements_to_iterate" />
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_render_mapping_occurrences">
        <xsl:param name="elements" />
        <xsl:param name="repo_field" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:param name="_elements_to_iterate" />

        <xsl:choose>
            <xsl:when test="contains($elements, ',')">
                <xsl:call-template name="_render_mapping_occurrences">
                    <xsl:with-param name="elements"    select="normalize-space(substring-before($elements, ','))" />
                    <xsl:with-param name="repo_field"  select="$repo_field" />
                    <xsl:with-param name="date-format" select="$date-format" />
                    <xsl:with-param name="max"         select="$max" />
                    <xsl:with-param name="_elements_to_iterate" select="normalize-space(substring-after($elements, ','))" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="fields" select="pubs:field[@name=normalize-space($elements)]" />
                <xsl:variable name="field_values" select="$fields/pubs:people/*|$fields/pubs:keywords/*|$fields/pubs:items/*|$fields/*[local-name()!='items' and local-name()!='keywords' and local-name()!='people']" />

                <xsl:for-each select="$field_values">
                    <xsl:if test="$max='' or position() &lt;= $max">
                        <xsl:call-template name="_render_field_occurrence">
                            <xsl:with-param name="field"  select="$repo_field" />
                            <xsl:with-param name="value">
                                <xsl:apply-templates select="." mode="mapping">
                                    <xsl:with-param name="name"><xsl:value-of select="ancestor::pubs:field/@name" /></xsl:with-param>
                                    <xsl:with-param name="repo_field" select="$repo_field" />
                                    <xsl:with-param name="date-format" select="$date-format" />
                                </xsl:apply-templates>
                            </xsl:with-param>
                            <xsl:with-param name="structured" />
                        </xsl:call-template>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="$_elements_to_iterate and ($max='' or count($field_values) &lt; $max)">
                    <xsl:call-template name="_render_mapping_occurrences">
                        <xsl:with-param name="elements"    select="$_elements_to_iterate" />
                        <xsl:with-param name="repo_field"  select="$repo_field" />
                        <xsl:with-param name="date-format" select="$date-format" />
                        <xsl:with-param name="max"><xsl:if test="$max &gt; 0"><xsl:value-of select="$max - count($field_values)"/></xsl:if></xsl:with-param>
                        <xsl:with-param name="_elements_to_iterate" />
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
