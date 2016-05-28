<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:crosswalks="info:symplectic/crosswalks"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                exclude-result-prefixes="pubs crosswalks dim"
                version="1.0">

    <xsl:import href="symplectic_xwalks_toolkit_config.xsl" />

    <xsl:import href="symplectic_xwalks_toolkit_fieldtypes_date.xsl" />

    <xsl:variable name="crosswalk-dictionaries" />
    <xsl:variable name="default-date-format">yyyy-mm-dd</xsl:variable>

    <xsl:template match="pubs:boolean">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select="." mode="render_with_dictionary">
            <xsl:with-param name="dictionary-name" select="$name" />
            <xsl:with-param name="dictionary-target" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:date">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />
        <xsl:param name="date-format" select="$default-date-format" />

        <xsl:choose>
            <xsl:when test="$date-format='dd'">
                <xsl:apply-templates select="." mode="dd">
                    <xsl:with-param name="name" select="$name" />
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$date-format='yyyy'">
                <xsl:apply-templates select="." mode="yyyy">
                    <xsl:with-param name="name" select="$name" />
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$date-format='dd-mm-yyyy'">
                <xsl:apply-templates select="." mode="dd-mm-yyyy">
                    <xsl:with-param name="name" select="$name" />
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$date-format='dd.mon.yyyy'">
                <xsl:apply-templates select="." mode="dd.mon.yyyy">
                    <xsl:with-param name="name" select="$name" />
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="yyyy-mm-dd">
                    <xsl:with-param name="name" select="$name" />
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="pubs:text">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select="." mode="render_with_dictionary">
            <xsl:with-param name="dictionary-name" select="$name" />
            <xsl:with-param name="dictionary-target" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:pagination">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:choose>
            <xsl:when test="$repository-type='eprints'">
                <xsl:choose>
                    <xsl:when test="boolean($config-eprints-fields/*[@name=$repo_field]/@type='pagerange')">
                        <xsl:apply-templates select="." mode="pagerange" />
                    </xsl:when>
                    <xsl:when test="boolean($config-eprints-fields/*[@name=$repo_field]/@type='int')">
                        <xsl:apply-templates select="." mode="pagecount" />
                    </xsl:when>
                    <xsl:when test="$repo_field=$config-eprints-pagerange-field">
                        <xsl:apply-templates select="." mode="pagerange" />
                    </xsl:when>
                    <xsl:when test="$repo_field=$config-eprints-pages-field">
                        <xsl:apply-templates select="." mode="pagecount" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="rangeandcount" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="rangeandcount" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="pubs:pagination" mode="rangeandcount">
        <xsl:choose>
            <xsl:when test="pubs:begin-page or pubs:end-page">
                <xsl:apply-templates select="." mode="pagerange" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>? - ?</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="pubs:page-count">
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="." mode="pagecount" />
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:pagination" mode="pagerange">
        <xsl:if test="pubs:begin-page or pubs:end-page">
            <xsl:choose>
                <xsl:when test="pubs:begin-page">
                    <xsl:value-of select="normalize-space(pubs:begin-page)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>?</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> - </xsl:text>
            <xsl:choose>
                <xsl:when test="pubs:end-page">
                    <xsl:value-of select="normalize-space(pubs:end-page)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>?</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:pagination" mode="pagecount">
        <xsl:value-of select="normalize-space(pubs:page-count)"/>
    </xsl:template>

    <xsl:template match="pubs:items/pubs:item">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select="." mode="render_with_dictionary">
            <xsl:with-param name="dictionary-name" select="$name" />
            <xsl:with-param name="dictionary-target" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:keywords/pubs:keyword">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select="." mode="render_with_dictionary">
            <xsl:with-param name="dictionary-name" select="$name" />
            <xsl:with-param name="dictionary-target" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:people/pubs:person">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:choose>
            <xsl:when test="$repository-type='eprints'">
                <name>
                    <xsl:if test="normalize-space(pubs:last-name)!=''"><family><xsl:value-of select="normalize-space(pubs:last-name)"/></family></xsl:if>
                    <xsl:if test="normalize-space(pubs:initials)!=''"><given><xsl:value-of select="normalize-space(pubs:initials)"/></given></xsl:if>
                </name>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(pubs:last-name)"/>
                <xsl:if test="(normalize-space(pubs:last-name)!='') and (normalize-space(pubs:initials)!='')">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:value-of select="normalize-space(pubs:initials)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="text()|@*|*" mode="render_with_dictionary">
        <xsl:param name="dictionary-name" />
        <xsl:param name="dictionary-target" />

        <xsl:variable name="value" select="normalize-space(.)" />
        <xsl:choose>
            <xsl:when test="$crosswalk-dictionaries and $crosswalk-dictionaries/crosswalks:dictionary[@elements=$dictionary-name and (@dspace=$dictionary-target or @eprints=$dictionary-target)]">
                <xsl:variable name="dictionary" select="$crosswalk-dictionaries/crosswalks:dictionary[@elements=$dictionary-name and (@dspace=$dictionary-target or @eprints=$dictionary-target)]" />

                <xsl:choose>
                    <xsl:when test="$dictionary/@mapped-only">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$dictionary">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" select="$value" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space($value)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$crosswalk-dictionaries and $crosswalk-dictionaries/crosswalks:dictionary[@elements=$dictionary-name]">
                <xsl:variable name="dictionary" select="$crosswalk-dictionaries/crosswalks:dictionary[@elements=$dictionary-name]" />

                <xsl:choose>
                    <xsl:when test="$dictionary/@mapped-only">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$dictionary">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" select="$value" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space($value)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$crosswalk-dictionaries and $crosswalk-dictionaries/crosswalks:dictionary[@dspace=$dictionary-target or @eprints=$dictionary-target]">
                <xsl:variable name="dictionary" select="$crosswalk-dictionaries/crosswalks:dictionary[@dspace=$dictionary-target or @eprints=$dictionary-target]" />

                <xsl:choose>
                    <xsl:when test="$dictionary/@mapped-only">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$dictionary">
                        <xsl:call-template name="_dictionary_value_or_default">
                            <xsl:with-param name="default" select="$value" />
                            <xsl:with-param name="value" select="$dictionary/crosswalks:entry[@elements=$value][1]" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space($value)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space($value)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_dictionary_value_or_default">
        <xsl:param name="value" />
        <xsl:param name="default" />

        <xsl:choose>
            <xsl:when test="$value">
                <xsl:choose>
                    <xsl:when test="$repository-type='dspace'">
                        <xsl:value-of select="normalize-space($value/@dspace)" />
                    </xsl:when>
                    <xsl:when test="$repository-type='eprints'">
                        <xsl:value-of select="normalize-space($value/@eprints)" />
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space($default)" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
