<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:crosswalks="info:symplectic/crosswalks"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                exclude-result-prefixes="crosswalks pubs dim"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_config.xsl" />

    <!--
        This template handles how a single mapping entry or template call should be rendered
        i.e. it is a wrapper around many occurrences that may occur in mapping from a list of elements fields
        (or fields that can contain multiple occurrences, such as authors)
    -->
    <xsl:template name="_render_field_mapping">
        <xsl:param name="field" />
        <xsl:param name="value" />

        <xsl:if test="normalize-space($value)">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:copy-of select="$value" /></xsl:when>
                <xsl:when test="$repository-type='eprints'">
                    <xsl:element name="{$field}">
                        <xsl:copy-of select="$value" />
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!--
        This template handles how a single mapping entry or template call should be rendered
        i.e. it is a wrapper around many occurrences that may occur in mapping from a list of elements fields
        (or fields that can contain multiple occurrences, such as authors)
    -->
    <xsl:template name="_render_field_occurrence">
        <xsl:param name="field" />
        <xsl:param name="value" />
        <xsl:param name="structured" />

        <xsl:if test="normalize-space($value)">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'">
                    <xsl:call-template name="_render_field_dspace">
                        <xsl:with-param name="field" select="$field" />
                        <xsl:with-param name="value"  select="$value" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$repository-type='eprints'">
                    <xsl:choose>
                        <xsl:when test="$structured"><xsl:copy-of select="$value" /></xsl:when>
                        <xsl:when test="boolean($config-eprints-fields/*[@name=$field]/@multiple)"><item><xsl:copy-of select="$value" /></item></xsl:when>
                        <xsl:when test="boolean($config-eprints-fields/*[@name=$field]/@type='compound')"><item><xsl:copy-of select="$value" /></item></xsl:when>
                        <xsl:otherwise><xsl:copy-of select="$value" /></xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template name="_render_field_dspace">
        <xsl:param name="field" />
        <xsl:param name="value" />

        <xsl:variable name="mdschema" select="substring-before($field, '.')" />
        <xsl:variable name="element-qualifier" select="substring-after($field, '.')" />
        <xsl:variable name="element">
            <xsl:value-of select="substring-before($element-qualifier, '.')" />
            <xsl:if test="not(contains($element-qualifier,'.'))"><xsl:value-of select="$element-qualifier" /></xsl:if>
        </xsl:variable>
        <xsl:variable name="qualifier" select="substring-after($element-qualifier, '.')" />
        <xsl:choose>
            <xsl:when test="normalize-space($qualifier) and normalize-space($default-lang)">
                <dim:field mdschema="{$mdschema}" element="{$element}" qualifier="{$qualifier}" lang="{$default-lang}">
                    <xsl:value-of select="normalize-space($value)" />
                </dim:field>
            </xsl:when>
            <xsl:when test="normalize-space($qualifier)">
                <dim:field mdschema="{$mdschema}" element="{$element}" qualifier="{$qualifier}">
                    <xsl:value-of select="normalize-space($value)" />
                </dim:field>
            </xsl:when>
            <xsl:when test="normalize-space($default-lang)">
                <dim:field mdschema="{$mdschema}" element="{$element}" lang="{$default-lang}">
                    <xsl:value-of select="normalize-space($value)" />
                </dim:field>
            </xsl:when>
            <xsl:otherwise>
                <dim:field mdschema="{$mdschema}" element="{$element}">
                    <xsl:value-of select="normalize-space($value)" />
                </dim:field>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>