<?xml version="1.0" encoding="UTF-8"?>
<!--
    
Oxygen WebHelp Plugin
Copyright (c) 1998-2018 Syncro Soft SRL, Romania.  All rights reserved.

-->

<!--
    Generate localization files for JS and PHP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs" version="2.0"
    xmlns:d="http://docbook.org/ns/docbook" xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
    xmlns:index="http://www.oxygenxml.com/ns/webhelp/index"
    xmlns:oxygen="http://www.oxygenxml.com/functions">

    <!-- Localization of text strings displayed in Webhelp output. -->
    <xsl:import href="../util/functions.xsl"/>

    <!-- Declares all available parameters -->
    <xsl:include href="params.xsl"/>

	<!-- 
	 	If this parameter is 'true' then we are running a 
		webhelp feedback enabled transformation
	-->
	<xsl:param name="WEBHELP_FEEDBACK_ENABLED"/>

    <!-- 
        Creates the localization files. 
    -->
    <xsl:template match="/">
        <!-- Get current detected language -->
        <xsl:variable name="language" select="lower-case(oxygen:getParameter('webhelp.language'))"/>
        <xsl:variable name="stringFileName" select="*/lang[@xml:lang = $language]/@filename"/>

        <xsl:variable name="stringFile"
            select="
                concat($BASEDIR, '/oxygen-webhelp/resources/localization/',
                if (string-length($stringFileName) > 0) then
                    $stringFileName
                else
                    'strings-en-us.xml')"/>
        
        <xsl:variable name="stringFileUrl"
            select="oxygen:makeURL($stringFile)"/>        
        
        <xsl:variable name="stringsElem" select="document($stringFileUrl)/strings"/>

        <!-- Generate localization files for JS -->
        <xsl:call-template name="generateJsLocalizationFile">
            <xsl:with-param name="stringsElem" select="$stringsElem"/>
            <xsl:with-param name="forFeedback" select="false()"/>
        </xsl:call-template>

        <!-- Generate localization files for PHP -->
        <xsl:if test="lower-case($WEBHELP_FEEDBACK_ENABLED)='true'"> 
            <!-- Generate localization files for JS for the feedback module -->
            <xsl:call-template name="generateJsLocalizationFile">
                <xsl:with-param name="stringsElem" select="$stringsElem"/>
                <xsl:with-param name="forFeedback" select="true()"/>
            </xsl:call-template>
            
	        <xsl:call-template name="generatePhpLocalizationFile">
	            <xsl:with-param name="stringsElem" select="$stringsElem"/>
	        </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!--
        Generate localization file for JS.
    -->
    <xsl:template name="generateJsLocalizationFile">
        <xsl:param name="stringsElem"/>
        <!-- true if the file is generated for the Feedback module. -->
        <xsl:param name="forFeedback" as="xs:boolean" select="false()"/>

        <xsl:variable name="jsResponsiveFileName" select="'oxygen-webhelp/app/localization/strings.js'"/>
        <xsl:variable name="jsFeedbackFileName" select="'oxygen-webhelp/feedback/resources/localization/strings.js'"/>
        <xsl:variable name="jsURL">
            <xsl:choose>
                <xsl:when test="$forFeedback">
                    <xsl:value-of select="oxygen:makeURL(concat($OUTPUTDIR, '/', $jsFeedbackFileName))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="oxygen:makeURL(concat($OUTPUTDIR, '/', $jsResponsiveFileName))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:result-document href="{$jsURL}" method="text">
            
            <xsl:if test="not($forFeedback)">
                <!-- Generate RequireJS define call -->
                <xsl:text>define(function() {</xsl:text>
            </xsl:if>
            
            <xsl:text>var localization = new Array();</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="generateArrayElements">
                <xsl:with-param name="arrayName" select="'localization'"/>
                <xsl:with-param name="strings" select="$stringsElem//str[@js = 'true']"/>
            </xsl:call-template>
            
            <xsl:if test="not($forFeedback)">
                <!-- End of RequireJS define call -->
                <xsl:text>return localization;});</xsl:text>
            </xsl:if>
        </xsl:result-document>

    </xsl:template>

    <!--
        Generate localization file for PHP.
    -->
    <xsl:template name="generatePhpLocalizationFile">
        <xsl:param name="stringsElem"/>

        <xsl:variable name="phpFileName"
            select="'oxygen-webhelp/feedback/resources/localization/strings.php'"/>
        <xsl:variable name="phpURL"
            select="oxygen:makeURL(concat($OUTPUTDIR, '/', $phpFileName))"/>
        
        <xsl:result-document href="{$phpURL}" method="text">
            <xsl:text>&lt;?php</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>$translate = array();</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:call-template name="generateArrayElements">
                <xsl:with-param name="arrayName" select="'$translate'"/>
                <xsl:with-param name="strings" select="$stringsElem//str[@php = 'true']"/>
            </xsl:call-template>

            <xsl:text>&#10;</xsl:text>
            <xsl:text>global $translate;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>?&gt;</xsl:text>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Generate localization array. -->
    <xsl:template name="generateArrayElements">
        <xsl:param name="arrayName"/>
        <xsl:param name="strings"/>

        <xsl:if test="count($strings) > 0">
            <xsl:for-each select="$strings">
                <xsl:value-of select="$arrayName"/>
                <xsl:text>["</xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:text>"]="</xsl:text>
                <xsl:value-of select="normalize-space()"/>
                <xsl:text>";</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
