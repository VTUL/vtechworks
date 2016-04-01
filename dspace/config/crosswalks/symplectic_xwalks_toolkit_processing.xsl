<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom"
                xmlns:crosswalks="info:symplectic/crosswalks"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                exclude-result-prefixes="pubs crosswalks dim atom"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_fieldtypes.xsl" />

    <xsl:template name="_process_mappings">
        <xsl:param name="mappings" />
        <xsl:param name="first-mapped-only" />
        <!-- Iterate over the mappings, starting with the first one -->
        <xsl:call-template name="_process_mapping_and_siblings">
            <xsl:with-param name="mapping" select="$mappings[1]" />
            <xsl:with-param name="first-mapped-only" select="$first-mapped-only" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_process_mapping_and_siblings">
        <xsl:param name="mapping" />
        <xsl:param name="first-mapped-only" />

        <xsl:variable name="value">
            <xsl:call-template name="_process_mapping">
                <xsl:with-param name="mapping" select="$mapping" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="normalize-space($value)">
            <xsl:copy-of select="$value" />
        </xsl:if>

        <xsl:choose>
            <xsl:when test="boolean($first-mapped-only) and normalize-space($value)" />
            <xsl:otherwise>
                <!-- Iterate over the remaining mappings -->
                <xsl:if test="$mapping/following-sibling::*">
                    <xsl:call-template name="_process_mapping_and_siblings">
                        <xsl:with-param name="mapping" select="$mapping/following-sibling::*[1]" />
                        <xsl:with-param name="first-mapped-only" select="$first-mapped-only" />
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template name="_process_mapping">
        <xsl:param name="mapping" />

        <xsl:choose>
            <xsl:when test="$mapping/@if-elements">
                <xsl:call-template name="_process_mapping_if">
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="condition" select="$mapping/@if-elements" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_process_mapping_stage_2">
                    <xsl:with-param name="mapping" select="$mapping" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_process_mapping_if">
        <xsl:param name="mapping" />
        <xsl:param name="condition" />

        <xsl:if test="pubs:field[@name=normalize-space($condition)]">
            <xsl:call-template name="_process_mapping_stage_2">
                <xsl:with-param name="mapping" select="$mapping" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="_process_mapping_stage_2">
        <xsl:param name="mapping" />

        <xsl:choose>
            <xsl:when test="$mapping/@first-mapped-only">
                <xsl:call-template name="_process_mappings">
                    <xsl:with-param name="mappings" select="$mapping/*" />
                    <xsl:with-param name="first-mapped-only">true</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_process_mapping_stage_3">
                    <xsl:with-param name="mapping" select="$mapping" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_process_mapping_stage_3">
        <xsl:param name="mapping" />

        <xsl:variable name="repo_field">
            <xsl:choose>
                <xsl:when test="$repository-type='dspace'"><xsl:value-of select="string($mapping/@dspace)" /></xsl:when>
                <xsl:when test="$repository-type='eprints'"><xsl:value-of select="string($mapping/@eprints)" /></xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$mapping/@feed-elements">
                <xsl:call-template name="_render_field_mapping">
                    <xsl:with-param name="field" select="$repo_field" />
                    <xsl:with-param name="value">
                        <xsl:call-template name="_render_field_occurrence">
                            <xsl:with-param name="field"  select="$repo_field" />
                            <xsl:with-param name="value">
                                <xsl:choose>
                                    <xsl:when test="$mapping/@feed-elements='category'">
                                        <xsl:apply-templates select="//atom:category/@term" mode="render_with_dictionary">
                                            <xsl:with-param name="dictionary-target" select="$repo_field" />
                                        </xsl:apply-templates>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:with-param>
                    <xsl:with-param name="structured" select="string($mapping/@structured)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@format-elements">
                <xsl:call-template name="_create_formatted">
                    <xsl:with-param name="template"         select="string($mapping/@format-elements)" />
                    <xsl:with-param name="repo_field"       select="$repo_field" />
                    <xsl:with-param name="field-start"      select="string($mapping/@field-start)" />
                    <xsl:with-param name="field-end"        select="string($mapping/@field-end)" />
                    <xsl:with-param name="field-wrap-start" select="string($mapping/@field-wrap-start)" />
                    <xsl:with-param name="field-wrap-end"   select="string($mapping/@field-wrap-end)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@list-elements">
                <xsl:call-template name="_create_list">
                    <xsl:with-param name="elements"       select="string($mapping/@list-elements)" />
                    <xsl:with-param name="repo_field"     select="$repo_field" />
                    <xsl:with-param name="list-separator" select="string($mapping/@list-separator)" />
                    <xsl:with-param name="date-format"    select="string($mapping/@date-format)" />
                    <xsl:with-param name="max"            select="string($mapping/@max)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@elements">
                <xsl:call-template name="_map_fields">
                    <xsl:with-param name="elements"    select="string($mapping/@elements)" />
                    <xsl:with-param name="repo_field"  select="$repo_field" />
                    <xsl:with-param name="date-format" select="string($mapping/@date-format)" />
                    <xsl:with-param name="max"         select="string($mapping/@max)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@text">
                <xsl:call-template name="_create_text">
                    <xsl:with-param name="text"        select="string($mapping/@text)" />
                    <xsl:with-param name="repo_field"  select="$repo_field" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$mapping/@dspace or $mapping/@eprints">
                        <xsl:call-template name="_render_mappings_to_field">
                            <xsl:with-param name="mappings" select="$mapping/*" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="structured" select="string($mapping/@structured)" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="_process_mappings">
                            <xsl:with-param name="mappings" select="$mapping/*" />
                            <xsl:with-param name="first-mapped-only" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_render_mappings_to_field">
        <xsl:param name="repo_field" />
        <xsl:param name="mappings" />
        <xsl:param name="structured" />

        <xsl:call-template name="_render_field_mapping">
            <xsl:with-param name="field" select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_field_occurrence">
                    <xsl:with-param name="field"            select="$repo_field" />
                    <xsl:with-param name="value">
                        <xsl:call-template name="_process_mappings">
                            <xsl:with-param name="mappings" select="$mappings" />
                            <xsl:with-param name="first-mapped-only" />
                        </xsl:call-template>
                    </xsl:with-param>
                    <xsl:with-param name="structured" select="$structured" />
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>