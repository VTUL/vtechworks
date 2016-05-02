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

    <xsl:import href="symplectic_xwalks_toolkit_list.xsl" />
    <xsl:import href="symplectic_xwalks_toolkit_utils.xsl" />

    <!-- Pull in definitions for formatted field rendering -->
    <xsl:import href="symplectic_xwalks_toolkit_formatted_fieldtypes.xsl" />

    <xsl:template name="_create_formatted">
        <xsl:param name="template" />
        <xsl:param name="repo_field" />

        <xsl:param name="field-start" />
        <xsl:param name="field-end" />
        <xsl:param name="field-wrap-start" />
        <xsl:param name="field-wrap-end" />

        <xsl:call-template name="_render_field_mapping">
            <xsl:with-param name="field" select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_render_formatted_occurrence">
                    <xsl:with-param name="template"         select="$template" />
                    <xsl:with-param name="repo_field"       select="$repo_field" />
                    <xsl:with-param name="field-start"      select="$field-start" />
                    <xsl:with-param name="field-end"        select="$field-end" />
                    <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                    <xsl:with-param name="field-wrap-end"   select="$field-wrap-end" />
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!--
        Internal template for creating a formatted field
        Takes the target field split into schema / element / qualifier
    -->
    <xsl:template name="_render_formatted_occurrence">
        <xsl:param name="template" />
        <xsl:param name="repo_field" />
        <xsl:param name="field-start" />
        <xsl:param name="field-end" />
        <xsl:param name="field-wrap-start" />
        <xsl:param name="field-wrap-end" />

        <!-- Render wrapper to only output element if there is content -->
        <xsl:call-template name="_render_field_occurrence">
            <xsl:with-param name="field"  select="$repo_field" />
            <xsl:with-param name="value">
                <xsl:call-template name="_make_formatted_value">
                    <xsl:with-param name="repo_field" select="$repo_field" />
                    <xsl:with-param name="preceding-text" />
                    <xsl:with-param name="following-text" />
                    <xsl:with-param name="processed-template" />
                    <xsl:with-param name="separator" />
                    <xsl:with-param name="value1" />
                    <xsl:with-param name="value2" />
                    <xsl:with-param name="remaining-template" select="$template" />
                    <xsl:with-param name="field-start">
                        <xsl:choose>
                            <xsl:when test="$field-start"><xsl:value-of select="$field-start" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$default-field-start" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="field-end">
                        <xsl:choose>
                            <xsl:when test="$field-end"><xsl:value-of select="$field-end" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$default-field-end" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="field-wrap-start">
                        <xsl:choose>
                            <xsl:when test="$field-wrap-start"><xsl:value-of select="$field-wrap-start" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$default-field-wrap-start" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                    <xsl:with-param name="field-wrap-end">
                        <xsl:choose>
                            <xsl:when test="$field-wrap-end"><xsl:value-of select="$field-wrap-end" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="$default-field-wrap-end" /></xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="structured" />
        </xsl:call-template>
    </xsl:template>

    <!--
        Internal template to generate the formatted value
        Parses the template (recursively), and calls iterate to handle
        field replacements
    -->
    <xsl:template name="_make_formatted_value">
        <xsl:param name="repo_field" />
        <xsl:param name="preceding-text" />
        <xsl:param name="value1" />
        <xsl:param name="separator" />
        <xsl:param name="value2" />
        <xsl:param name="following-text" />
        <xsl:param name="processed-template" />
        <xsl:param name="remaining-template" />
        <xsl:param name="field-start" />
        <xsl:param name="field-end" />
        <xsl:param name="field-wrap-start" />
        <xsl:param name="field-wrap-end" />

        <xsl:choose>
            <!-- Whilst there is still unprocessed template -->
            <xsl:when test="$remaining-template">
                <xsl:choose>
                    <!-- Do we have a wrapper to process next? -->
                    <xsl:when test="contains($remaining-template, $field-start) and contains($remaining-template, $field-wrap-start) and string-length(substring-before($remaining-template, $field-wrap-start)) &lt; string-length(substring-before($remaining-template, $field-start))">
                        <xsl:variable name="wrapper-preceding" select="substring-before($remaining-template, $field-wrap-start)" />
                        <xsl:variable name="remainder" select="substring-after($remaining-template, $field-wrap-start)" />
                        <xsl:variable name="wrapped" select="substring-before($remainder, $field-wrap-end)" />
                        <xsl:variable name="wrapper-following" select="substring-after($remainder, $field-wrap-end)" />

                        <xsl:choose>
                            <!-- If this is NOT the start of the template (or wrapped section) -->
                            <xsl:when test="$processed-template">
                                <!--
                                    The outer call to _make_formatted_value joins whatever we have processed so far,
                                    with the result of processing the rest of the template, using our separator.
                                    Within value2, we have to have two nested calls, outer one processes the rest of
                                    the template, and the inner one is processing the wrapped section as a
                                    separate template.
                                    It is creating a structure like:
                                    ([t1],              )
                                           ([t2],       )
                                                   ([t3])
                                -->
                                <!-- xsl:call-template name="_make_formatted_value" -->
                                <xsl:call-template name="_make_formatted_value_join">
                                    <xsl:with-param name="preceding-text" select="$preceding-text" />
                                    <xsl:with-param name="value1" select="$value1" />
                                    <xsl:with-param name="separator" select="$wrapper-preceding" />
                                    <!-- Process the rest of the template -->
                                    <xsl:with-param name="value2">
                                        <xsl:call-template name="_make_formatted_value">
                                            <xsl:with-param name="repo_field" select="$repo_field" />
                                            <xsl:with-param name="preceding-text" />
                                            <!--
                                                Process the wrapped template as a separate template
                                                This becomes the first value, and is joined with the rest of
                                                the template that follows it.
                                             -->
                                            <xsl:with-param name="value1">
                                                <xsl:call-template name="_make_formatted_value">
                                                    <xsl:with-param name="repo_field" select="$repo_field" />
                                                    <xsl:with-param name="preceding-text" />
                                                    <xsl:with-param name="value1" />
                                                    <xsl:with-param name="separator" />
                                                    <xsl:with-param name="value2" />
                                                    <xsl:with-param name="following-text" />
                                                    <xsl:with-param name="processed-template" />
                                                    <xsl:with-param name="remaining-template" select="$wrapped" />
                                                    <xsl:with-param name="field-start" select="$field-start" />
                                                    <xsl:with-param name="field-end" select="$field-end" />
                                                    <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                                    <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                                </xsl:call-template>
                                            </xsl:with-param>
                                            <xsl:with-param name="separator" />
                                            <xsl:with-param name="value2" />
                                            <xsl:with-param name="following-text" />
                                            <xsl:with-param name="processed-template">yes</xsl:with-param>
                                            <xsl:with-param name="remaining-template" select="$wrapper-following" />
                                            <xsl:with-param name="field-start" select="$field-start" />
                                            <xsl:with-param name="field-end" select="$field-end" />
                                            <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                            <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="following-text" />
                                </xsl:call-template>
                            </xsl:when>
                            <!-- Start of template -->
                            <xsl:otherwise>
                                <!--
                                    Recursive call. Preceding text is passed as preceding text,
                                    and the current template becomes value1.
                                    We use a call to _make_formatted_value to process the wrapped template
                                    as if it was a standalone template.
                                    We pass processed-template, to indicate that the next call is not at
                                    the start of the template (even if the field comes back as unmatched).
                                    The remaining template is everything after the template
                                -->
                                <xsl:call-template name="_make_formatted_value">
                                    <xsl:with-param name="repo_field" select="$repo_field" />
                                    <xsl:with-param name="preceding-text" select="$wrapper-preceding" />
                                    <xsl:with-param name="value1">
                                        <xsl:call-template name="_make_formatted_value">
                                            <xsl:with-param name="repo_field" select="$repo_field" />
                                            <xsl:with-param name="preceding-text" />
                                            <xsl:with-param name="value1" />
                                            <xsl:with-param name="separator" />
                                            <xsl:with-param name="value2" />
                                            <xsl:with-param name="following-text" />
                                            <xsl:with-param name="processed-template" />
                                            <xsl:with-param name="remaining-template" select="$wrapped" />
                                            <xsl:with-param name="field-start" select="$field-start" />
                                            <xsl:with-param name="field-end" select="$field-end" />
                                            <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                            <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="separator" />
                                    <xsl:with-param name="value2" />
                                    <xsl:with-param name="following-text" />
                                    <xsl:with-param name="processed-template">yes</xsl:with-param>
                                    <xsl:with-param name="remaining-template" select="$wrapper-following" />
                                    <xsl:with-param name="field-start" select="$field-start" />
                                    <xsl:with-param name="field-end" select="$field-end" />
                                    <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                    <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!-- No wrapped section, or unwrapped field comes first -->
                    <xsl:when test="contains($remaining-template, $field-start)">
                        <xsl:variable name="field-preceding" select="substring-before($remaining-template, $field-start)" />
                        <xsl:variable name="remainder" select="substring-after($remaining-template, $field-start)" />
                        <xsl:variable name="field" select="substring-before($remainder, $field-end)" />
                        <xsl:variable name="field-following" select="substring-after($remainder, $field-end)" />

                        <xsl:choose>
                            <!-- Not at the start of the template -->
                            <xsl:when test="$processed-template">
                                <!--
                                    The outer call to _make_formatted_value joins whatever we have processed so far,
                                    with the result of processing the rest of the template, using our separator.
                                    The inner call processes the rest of the template.
                                    It is creating a structure like:
                                    ([f1],              )
                                           ([f2],       )
                                                   ([f3])
                                -->
                                <xsl:call-template name="_make_formatted_value_join">
                                    <xsl:with-param name="preceding-text" select="$preceding-text" />
                                    <xsl:with-param name="value1" select="$value1" />
                                    <xsl:with-param name="separator" select="$field-preceding" />
                                    <!-- Process the remainder of the template to become the second field -->
                                    <xsl:with-param name="value2">
                                        <xsl:call-template name="_make_formatted_value">
                                            <xsl:with-param name="repo_field" select="$repo_field" />
                                            <xsl:with-param name="preceding-text" />
                                            <!--
                                                Render the current field as the first value
                                                this is then joined with the rest of the template
                                            -->
                                            <xsl:with-param name="value1">
                                                <xsl:call-template name="_render_formatted_field">
                                                    <xsl:with-param name="field" select="$field" />
                                                    <xsl:with-param name="repo_field" select="$repo_field" />
                                                </xsl:call-template>
                                            </xsl:with-param>
                                            <xsl:with-param name="separator" />
                                            <xsl:with-param name="value2" />
                                            <xsl:with-param name="following-text" />
                                            <xsl:with-param name="processed-template">yes</xsl:with-param>
                                            <xsl:with-param name="remaining-template" select="$field-following" />
                                            <xsl:with-param name="field-start" select="$field-start" />
                                            <xsl:with-param name="field-end" select="$field-end" />
                                            <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                            <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="following-text" />
                                </xsl:call-template>
                            </xsl:when>
                            <!-- Start of template -->
                            <xsl:otherwise>
                                <!--
                                    Recursive call. Preceding text is passed as preceding text,
                                    and the current field becomes value1.
                                    We pass processed-template, to indicate that the next call is not at
                                    the start of the template (even if the field comes back as unmatched).
                                    The remaining template is everything after the field
                                -->
                                <xsl:call-template name="_make_formatted_value">
                                    <xsl:with-param name="repo_field" select="$repo_field" />
                                    <xsl:with-param name="preceding-text" select="$field-preceding" />
                                    <xsl:with-param name="value1">
                                        <xsl:call-template name="_render_formatted_field">
                                            <xsl:with-param name="field" select="$field" />
                                            <xsl:with-param name="repo_field" select="$repo_field" />
                                        </xsl:call-template>
                                    </xsl:with-param>
                                    <xsl:with-param name="separator" />
                                    <xsl:with-param name="value2" />
                                    <xsl:with-param name="following-text" />
                                    <xsl:with-param name="processed-template">yes</xsl:with-param>
                                    <xsl:with-param name="remaining-template" select="$field-following" />
                                    <xsl:with-param name="field-start" select="$field-start" />
                                    <xsl:with-param name="field-end" select="$field-end" />
                                    <xsl:with-param name="field-wrap-start" select="$field-wrap-start" />
                                    <xsl:with-param name="field-wrap-end" select="$field-wrap-end" />
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="_make_formatted_value_join">
                            <xsl:with-param name="preceding-text" select="$preceding-text" />
                            <xsl:with-param name="value1" select="$value1" />
                            <xsl:with-param name="separator" select="$separator" />
                            <xsl:with-param name="value2" select="$value2" />
                            <xsl:with-param name="following-text" select="$remaining-template" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- No remaining template -->
            <xsl:otherwise>
                <!-- Join the values -->
                <xsl:call-template name="_make_formatted_value_join">
                    <xsl:with-param name="preceding-text" select="$preceding-text" />
                    <xsl:with-param name="value1" select="$value1" />
                    <xsl:with-param name="separator" select="$separator" />
                    <xsl:with-param name="value2" select="$value2" />
                    <xsl:with-param name="following-text" select="$following-text" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_make_formatted_value_join">
        <xsl:param name="preceding-text" />
        <xsl:param name="value1" />
        <xsl:param name="separator" />
        <xsl:param name="value2" />
        <xsl:param name="following-text" />

        <xsl:if test="normalize-space($value1) or normalize-space($value2)">
            <xsl:value-of select="$preceding-text" />
            <xsl:value-of select="normalize-space($value1)" />
            <xsl:if test="normalize-space($value1) and normalize-space($value2)">
                <xsl:value-of select="$separator" />
            </xsl:if>
            <xsl:value-of select="normalize-space($value2)" />
            <xsl:value-of select="$following-text" />
        </xsl:if>
    </xsl:template>

    <xsl:template name="_render_formatted_field">
        <xsl:param name="field" />
        <xsl:param name="repo_field" />

        <xsl:call-template name="_render_formatted_field_with_options">
            <xsl:with-param name="field">
                <xsl:value-of select="substring-before($field, ':')" />
                <xsl:if test="not(contains($field, ':'))"><xsl:value-of select="$field" /></xsl:if>
            </xsl:with-param>
            <xsl:with-param name="repo_field" select="$repo_field" />
            <xsl:with-param name="options" select="substring-after($field, ':')" />
            <xsl:with-param name="list-separator" />
            <xsl:with-param name="date-format" />
            <xsl:with-param name="max" />
            <xsl:with-param name="missing" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="_render_formatted_field_with_options">
        <xsl:param name="field" />
        <xsl:param name="repo_field" />
        <xsl:param name="options" />

        <xsl:param name="list-separator" />
        <xsl:param name="date-format" />
        <xsl:param name="max" />
        <xsl:param name="missing" />

        <xsl:choose>
            <!-- If we have options to process -->
            <xsl:when test="$options">
                <!-- normalize the spaces -->
                <xsl:variable name="normalized" select="normalize-space($options)" />

                <!-- see what the "next" option is -->
                <xsl:choose>
                    <!-- option supplied is a date format -->
                    <xsl:when test="starts-with($normalized, 'date')">
                        <!-- Iterate any remaining options, passing the extracted date format -->
                        <xsl:call-template name="_render_formatted_field_with_options">
                            <xsl:with-param name="field"   select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="options" select="substring-after($normalized, '),')" />
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format">
                                <xsl:call-template name="_get_date_format">
                                    <xsl:with-param name="options" select="$normalized" />
                                </xsl:call-template>
                            </xsl:with-param>
                            <xsl:with-param name="max" select="$max" />
                            <xsl:with-param name="missing" select="$missing" />
                        </xsl:call-template>
                    </xsl:when>
                    <!-- option supplied is a list separator -->
                    <xsl:when test="starts-with($normalized, 'list')">
                        <!-- Iterate any remaining options, passing the extracted list separator -->
                        <xsl:call-template name="_render_formatted_field_with_options">
                            <xsl:with-param name="field"   select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="options" select="substring-after($normalized, '),')" />
                            <xsl:with-param name="list-separator">
                                <xsl:call-template name="_get_list_separator">
                                    <xsl:with-param name="options" select="$normalized" />
                                </xsl:call-template>
                            </xsl:with-param>
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max" select="$max" />
                            <xsl:with-param name="missing" select="$missing" />
                        </xsl:call-template>
                    </xsl:when>
                    <!-- option supplied is max value (for lists)  -->
                    <xsl:when test="starts-with($normalized, 'max')">
                        <!-- Iterate any remaining options, passing the extracted max value -->
                        <xsl:call-template name="_render_formatted_field_with_options">
                            <xsl:with-param name="field"   select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="options" select="substring-after($normalized, '),')" />
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max">
                                <xsl:call-template name="_get_max">
                                    <xsl:with-param name="options" select="$normalized" />
                                </xsl:call-template>
                            </xsl:with-param>
                            <xsl:with-param name="missing" select="$missing" />
                        </xsl:call-template>
                    </xsl:when>
                    <!-- option supplied is a value to use for a missing field  -->
                    <xsl:when test="starts-with($normalized, 'missing')">
                        <!-- Iterate any remaining options, passing the extracted missing replacement -->
                        <xsl:call-template name="_render_formatted_field_with_options">
                            <xsl:with-param name="field"   select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="options" select="substring-after($normalized, '),')" />
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max" select="$missing" />
                            <xsl:with-param name="missing">
                                <xsl:call-template name="_get_missing">
                                    <xsl:with-param name="options" select="$normalized" />
                                </xsl:call-template>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- No known options left -->
                    <xsl:otherwise>
                        <!-- Iterate again, with no options to process -->
                        <xsl:call-template name="_render_formatted_field_with_options">
                            <xsl:with-param name="field"   select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="options"/>
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max" select="$max" />
                            <xsl:with-param name="missing" select="$missing" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- There are no options to process, so do some work with our given parameters -->
            <xsl:otherwise>
                <xsl:choose>
                    <!-- We have a list separator, so generate a list -->
                    <xsl:when test="$list-separator">
                        <xsl:call-template name="_render_elements_to_list">
                            <xsl:with-param name="elements" select="$field" />
                            <xsl:with-param name="list-separator" select="$list-separator" />
                            <xsl:with-param name="date-format" select="$date-format" />
                            <xsl:with-param name="max" select="$max" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="_elements_to_iterate" />
                        </xsl:call-template>
                    </xsl:when>
                    <!-- No list separator, and field exists, so just output a single value -->
                    <xsl:when test="*[@name=$field][1]/*[1]">
                        <xsl:apply-templates select="*[@name=$field][1]/*[1]" mode="formatted">
                            <xsl:with-param name="name" select="$field" />
                            <xsl:with-param name="repo_field" select="$repo_field" />
                            <xsl:with-param name="date-format" select="$date-format" />
                        </xsl:apply-templates>
                    </xsl:when>
                    <!-- Field doesn't exist, but we should output a "missing" marker -->
                    <xsl:when test="$missing!=''">
                        <xsl:value-of select="$missing" />
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_get_date_format">
        <xsl:param name="options" />
        <xsl:choose>
            <xsl:when test="contains($options, '(') and contains($options, ',') and string-length(substring-before($options, '(')) &lt; string-length(substring-before($options, '('))">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
            <xsl:when test="contains($options,'(')">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_get_list_separator">
        <xsl:param name="options" />
        <xsl:choose>
            <xsl:when test="contains($options, '(') and contains($options, ',') and string-length(substring-before($options, '(')) &lt; string-length(substring-before($options, '('))">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
            <xsl:when test="contains($options,'(')">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>; </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_get_max">
        <xsl:param name="options" />
        <xsl:choose>
            <xsl:when test="contains($options, '(') and contains($options, ',') and string-length(substring-before($options, '(')) &lt; string-length(substring-before($options, '('))">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
            <xsl:when test="contains($options,'(')">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="_get_missing">
        <xsl:param name="options" />
        <xsl:choose>
            <xsl:when test="contains($options, '(') and contains($options, ',') and string-length(substring-before($options, '(')) &lt; string-length(substring-before($options, '('))">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
            <xsl:when test="contains($options,'(')">
                <xsl:value-of select="substring-before(substring-after($options, '('), ')')" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
