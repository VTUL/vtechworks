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

    <xsl:template match="pubs:date" mode="dd">
        <xsl:if test="pubs:day">
            <xsl:value-of select="normalize-space(pubs:day)"/>
            <xsl:if test="pubs:month or pubs:year">
                <xsl:text>-</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:date" mode="dd-mm-yyyy">
        <xsl:if test="pubs:day">
            <xsl:if test="string-length(normalize-space(pubs:day)) = 1"><xsl:text>0</xsl:text></xsl:if>
            <xsl:value-of select="normalize-space(pubs:day)"/>
            <xsl:if test="pubs:month or pubs:year">
                <xsl:text>-</xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:month">
            <xsl:if test="string-length(normalize-space(pubs:month)) = 1"><xsl:text>0</xsl:text></xsl:if>
            <xsl:value-of select="normalize-space(pubs:month)"/>
            <xsl:if test="pubs:year">
                <xsl:text>-</xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:year">
            <xsl:value-of select="normalize-space(pubs:year)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:date" mode="yyyy-mm-dd">
        <xsl:if test="pubs:year">
            <xsl:value-of select="normalize-space(pubs:year)"/>
            <xsl:if test="pubs:month or pubs:day">
                <xsl:text>-</xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:month">
            <xsl:if test="string-length(normalize-space(pubs:month)) = 1"><xsl:text>0</xsl:text></xsl:if>
            <xsl:value-of select="normalize-space(pubs:month)"/>
            <xsl:if test="pubs:day">
                <xsl:text>-</xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:day">
            <xsl:if test="string-length(normalize-space(pubs:day)) = 1"><xsl:text>0</xsl:text></xsl:if>
            <xsl:value-of select="normalize-space(pubs:day)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="pubs:date" mode="yyyy">
        <xsl:value-of select="normalize-space(pubs:year)"/>
    </xsl:template>

    <xsl:template match="pubs:date" mode="dd.mon.yyyy">
        <xsl:if test="pubs:day">
            <xsl:if test="string-length(normalize-space(pubs:day)) = 1"><xsl:text>0</xsl:text></xsl:if>
            <xsl:value-of select="normalize-space(pubs:day)"/>
            <xsl:if test="pubs:month or pubs:year">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:month">
            <xsl:call-template name="_render_month_as_text">
                <xsl:with-param name="month"><xsl:value-of select="normalize-space(pubs:month)"/></xsl:with-param>
            </xsl:call-template>
            <xsl:if test="pubs:year">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:if test="pubs:year">
            <xsl:value-of select="normalize-space(pubs:year)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="_render_month_as_text">
        <xsl:param name="month" />
        <xsl:choose>
            <xsl:when test="$month='1'">January</xsl:when>
            <xsl:when test="$month='2'">February</xsl:when>
            <xsl:when test="$month='3'">March</xsl:when>
            <xsl:when test="$month='4'">April</xsl:when>
            <xsl:when test="$month='5'">May</xsl:when>
            <xsl:when test="$month='6'">June</xsl:when>
            <xsl:when test="$month='7'">July</xsl:when>
            <xsl:when test="$month='8'">August</xsl:when>
            <xsl:when test="$month='9'">September</xsl:when>
            <xsl:when test="$month='10'">October</xsl:when>
            <xsl:when test="$month='11'">November</xsl:when>
            <xsl:when test="$month='12'">December</xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>