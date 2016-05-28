<?xml version="1.0" encoding="utf-8"?>
<!--
  ~ Copyright (c) 2012 Symplectic Ltd. All Rights Reserved
    Symplectic Crosswalks Toolkit: version 1.4.0
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="symplectic_xwalks_toolkit_utils.xsl" />

    <xsl:template name="_create_text">
        <xsl:param name="text" />
        <xsl:param name="repo_field" />

        <xsl:call-template name="_render_field_mapping">
            <xsl:with-param name="field" select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_field_occurrence">
                    <xsl:with-param name="field" select="$repo_field" />
                    <xsl:with-param name="value" select="$text" />
                    <xsl:with-param name="structured" />
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>