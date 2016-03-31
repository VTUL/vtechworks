<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:pubs="http://www.symplectic.co.uk/publications/atom-api"
                exclude-result-prefixes="pubs"
                version="1.0">

    <xsl:template match="pubs:boolean" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:date" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />
        <xsl:param name="date-format" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
            <xsl:with-param name="date-format" select="$date-format" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:item" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:keyword" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:pagination" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:person" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="pubs:text" mode="mapping">
        <xsl:param name="name" />
        <xsl:param name="repo_field" />

        <xsl:apply-templates select=".">
            <xsl:with-param name="name" select="$name" />
            <xsl:with-param name="repo_field" select="$repo_field" />
        </xsl:apply-templates>
    </xsl:template>
</xsl:stylesheet>
