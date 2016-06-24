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

    <xsl:import href="symplectic_xwalks_toolkit_utils.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_list_fieldtypes.xsl" />

    <xsl:template name="_create_list">
        <xsl:param name="elements" />
        <xsl:param name="repo_field" />

        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:call-template name="_render_field_mapping">
            <xsl:with-param name="field" select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_list_occurrence">
                    <xsl:with-param name="elements"       select="$elements" />
                    <xsl:with-param name="repo_field"     select="$repo_field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="date-format"    select="$date-format" />
                    <xsl:with-param name="max"            select="$max" />
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_render_list_occurrence">
        <xsl:param name="elements" />
        <xsl:param name="repo_field" />
        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:call-template name="_render_field_occurrence">
            <xsl:with-param name="field"  select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_elements_to_list">
                    <xsl:with-param name="elements" select="$elements" />
                    <xsl:with-param name="repo_field" select="$repo_field" />
                    <xsl:with-param name="list-separator">
                        <xsl:choose>
                            <xsl:when test="$list-separator"><xsl:value-of select="$list-separator" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$default-list-separator" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="date-format" select="$date-format" />
                    <xsl:with-param name="max" select="$max" />
                    <xsl:with-param name="_elements_to_iterate" />
                </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="structured" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_render_elements_to_list">
        <xsl:param name="elements" />
        <xsl:param name="repo_field" />
        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />

        <xsl:param name="_elements_to_iterate" />

        <xsl:choose>
            <xsl:when test="contains($elements, ',')">
                <xsl:call-template name="_render_elements_to_list">
                    <xsl:with-param name="elements" select="normalize-space(substring-before($elements, ','))" />
                    <xsl:with-param name="repo_field" select="$repo_field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="date-format" select="$date-format" />
                    <xsl:with-param name="max" select="$max" />
                    <xsl:with-param name="_elements_to_iterate" select="normalize-space(substring-after($elements, ','))" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="fields" select="pubs:field[@name=normalize-space($elements)]" />
                <xsl:variable name="field_values" select="$fields/pubs:people/*|$fields/pubs:keywords/*|$fields/pubs:items/*|$fields/*[local-name()!='items' and local-name()!='keywords' and local-name()!='people']" />
                <xsl:call-template name="_render_elements_to_list_join">
                    <xsl:with-param name="value1">
                        <xsl:apply-templates select="$field_values" mode="_render_to_list">
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max" select="$max" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                        </xsl:apply-templates>
                    </xsl:with-param>
                    <xsl:with-param name="separator" select="$list-separator" />
                    <xsl:with-param name="value2">
                        <xsl:if test="$_elements_to_iterate and ($max='' or count($field_values) &lt; $max)">
                            <xsl:call-template name="_render_elements_to_list">
                                <xsl:with-param name="elements" select="$_elements_to_iterate" />
                                <xsl:with-param name="repo_field" select="$repo_field" />
                                <xsl:with-param name="list-separator" select="$list-separator" />
                                <xsl:with-param name="date-format" select="$date-format" />
                                <xsl:with-param name="max"><xsl:if test="$max &gt; 0"><xsl:value-of select="$max - count($field_values)"/></xsl:if></xsl:with-param>
                                <xsl:with-param name="_elements_to_iterate" />
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*" mode="_render_to_list">
        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />
        <xsl:param name="repo_field" />

        <xsl:if test="$max='' or position() &lt;= $max">
            <xsl:if test="position()!=1">
                <xsl:value-of select="$list-separator" />
            </xsl:if>
            <xsl:apply-templates select="." mode="list">
                <xsl:with-param name="name" select="ancestor::pubs:field/@name" />
                <xsl:with-param name="repo_field" select="$repo_field" />
                <xsl:with-param name="date-format" select="$date-format" />
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>

    <xsl:template name="_render_elements_to_list_join">
        <xsl:param name="value1" />
        <xsl:param name="separator" />
        <xsl:param name="value2" />

        <xsl:value-of select="normalize-space($value1)" />
        <xsl:if test="normalize-space($value1) and normalize-space($value2)">
            <xsl:value-of select="$separator" />
        </xsl:if>
        <xsl:value-of select="normalize-space($value2)" />
    </xsl:template>
</xsl:stylesheet>
