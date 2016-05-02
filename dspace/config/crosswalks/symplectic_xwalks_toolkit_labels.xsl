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
                exclude-result-prefixes="pubs crosswalks dim atom"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_config.xsl" />

    <xsl:import href="symplectic_xwalks_toolkit_list.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_mapping.xsl" />

    <xsl:template name="_process_label_mappings">
        <xsl:param name="nodes" select="/.." />
        <xsl:param name="mappings" select="$crosswalk-label-mappings/*" />

        <xsl:call-template name="_process_label_mapping">
            <xsl:with-param name="nodes" select="$nodes" />
            <xsl:with-param name="mapping" select="$mappings[1]" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_process_label_mapping">
        <xsl:param name="nodes" select="/.." />
        <xsl:param name="mapping" />

        <xsl:choose>
            <xsl:when test="$mapping/*">
                <xsl:call-template name="_process_label_mapping_includes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="mapping" select="$mapping/*[1]" />
                    <xsl:with-param name="repo-field">
                        <xsl:choose>
                            <xsl:when test="$repository-type='dspace'"><xsl:value-of select="string($mapping/@dspace)" /></xsl:when>
                            <xsl:when test="$repository-type='eprints'"><xsl:value-of select="string($mapping/@eprints)" /></xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="list-separator" select="string($mapping/@list-separator)" />
                    <xsl:with-param name="use-siblings">true</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_process_label_mapping_includes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field">
                        <xsl:choose>
                            <xsl:when test="$repository-type='dspace'"><xsl:value-of select="string($mapping/@dspace)" /></xsl:when>
                            <xsl:when test="$repository-type='eprints'"><xsl:value-of select="string($mapping/@eprints)" /></xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="list-separator" select="string($mapping/@list-separator)" />
                    <xsl:with-param name="use-siblings" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$mapping/following-sibling::*">
            <xsl:call-template name="_process_label_mapping">
                <xsl:with-param name="nodes" select="$nodes" />
                <xsl:with-param name="mapping" select="$mapping/following-sibling::*" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="_process_label_mapping_includes">
        <xsl:param name="nodes" />
        <xsl:param name="mapping" />
        <xsl:param name="repo-field" />
        <xsl:param name="list-separator" />
        <xsl:param name="use-siblings" />

        <xsl:variable name="nodes_to_add" select="*" />

        <xsl:choose>
            <xsl:when test="$mapping/@scheme and $mapping/@origin and $mapping/@source">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@scheme=$mapping/@scheme and @origin=$mapping/@origin and @source=$mapping/@source]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@origin and $mapping/@source">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@origin=$mapping/@origin and @source=$mapping/@source]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@scheme and $mapping/@origin">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@scheme=$mapping/@scheme and @origin=$mapping/@origin]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@scheme and $mapping/@source">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@scheme=$mapping/@scheme and @source=$mapping/@source]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@scheme">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@scheme=$mapping/@scheme]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@origin">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@origin=$mapping/@origin]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@source">
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add[@source=$mapping/@source]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_process_label_mapping_excludes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="nodes_to_add" select="$nodes_to_add" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_process_label_mapping_excludes">
        <xsl:param name="nodes" />
        <xsl:param name="nodes_to_add" />
        <xsl:param name="mapping" />
        <xsl:param name="repo-field" />
        <xsl:param name="list-separator" />
        <xsl:param name="use-siblings" />

        <xsl:choose>
            <xsl:when test="$mapping/@exclude-scheme and $mapping/@exclude-origin and $mapping/@exclude-source">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@scheme=$mapping/@exclude-scheme and @origin=$mapping/@exclude-origin and @source=$mapping/@exclude-source)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-origin and $mapping/@exclude-source">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@origin=$mapping/@exclude-origin and @source=$mapping/@exclude-source)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-scheme and $mapping/@exclude-origin">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@scheme=$mapping/@exclude-scheme and @origin=$mapping/@exclude-origin)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-scheme and $mapping/@exclude-source">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@scheme=$mapping/@exclude-scheme and @source=$mapping/@exclude-source)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-scheme">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@scheme=$mapping/@exclude-scheme)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-origin">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@origin=$mapping/@exclude-origin)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$mapping/@exclude-source">
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add[not(@source=$mapping/@exclude-source)]" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_process_label_mapping_output">
                    <xsl:with-param name="nodes" select="$nodes|$nodes_to_add" />
                    <xsl:with-param name="mapping" select="$mapping" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_process_label_mapping_output">
        <xsl:param name="nodes" />
        <xsl:param name="mapping" />
        <xsl:param name="repo-field" />
        <xsl:param name="list-separator" />
        <xsl:param name="use-siblings" />

        <xsl:choose>
            <xsl:when test="$use-siblings and $mapping/following-sibling::*">
                <xsl:call-template name="_process_label_mapping_includes">
                    <xsl:with-param name="nodes" select="$nodes" />
                    <xsl:with-param name="mapping" select="$mapping/following-sibling::*[1]" />
                    <xsl:with-param name="repo-field" select="$repo-field" />
                    <xsl:with-param name="list-separator" select="$list-separator" />
                    <xsl:with-param name="use-siblings" select="$use-siblings" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$list-separator">
                <!--
                    Render as a string list
                    - note this duplicates some code from elsewhere. Should try to consolidate later.
                -->
                <xsl:call-template name="_render_field_mapping">
                    <xsl:with-param name="field" select="$repo-field" />
                    <xsl:with-param name="value">
                        <xsl:call-template name="_render_field_occurrence">
                            <xsl:with-param name="field"  select="$repo-field" />
                            <xsl:with-param name="value">
                                <xsl:apply-templates select="$nodes" mode="_render_to_list">
                                    <!-- xsl:with-param name="max" / --><!-- max restriction not implemented -->
                                    <xsl:with-param name="list-separator" select="$list-separator" />
                                    <xsl:with-param name="repo_field" select="$repo-field" />
                                </xsl:apply-templates>
                            </xsl:with-param>
                            <xsl:with-param name="structured" />
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <!--
                    Render as separate instances
                    - note this duplicates some code from elsewhere. Should try to consolidate later.
                -->
                <xsl:call-template name="_render_field_mapping">
                    <xsl:with-param name="field" select="$repo-field" />
                    <xsl:with-param name="value">
                        <!-- Render multiple occurrences -->
                        <xsl:for-each select="$nodes">
                            <!-- Max restriction not implemented for now -->
                            <!-- xsl:if test="$max='' or position() &lt;= $max" -->
                                <xsl:call-template name="_render_field_occurrence">
                                    <xsl:with-param name="field"  select="$repo-field" />
                                    <xsl:with-param name="value">
                                        <xsl:apply-templates select="." mode="mapping">
                                            <xsl:with-param name="name">labels</xsl:with-param>
                                            <xsl:with-param name="repo_field" select="$repo-field" />
                                        </xsl:apply-templates>
                                    </xsl:with-param>
                                    <xsl:with-param name="structured" />
                                </xsl:call-template>
                            <!-- /xsl:if -->
                        </xsl:for-each>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
</xsl:stylesheet>