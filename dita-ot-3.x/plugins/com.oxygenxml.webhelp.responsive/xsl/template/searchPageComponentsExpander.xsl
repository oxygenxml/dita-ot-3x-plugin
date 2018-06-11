<?xml version="1.0" encoding="UTF-8"?>
<!--
    
Oxygen Webhelp plugin
Copyright (c) 1998-2018 Syncro Soft SRL, Romania.  All rights reserved.

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:toc="http://www.oxygenxml.com/ns/webhelp/toc"
  xmlns:index="http://www.oxygenxml.com/ns/webhelp/index"   
  xmlns:oxygen="http://www.oxygenxml.com/functions" xmlns:d="http://docbook.org/ns/docbook"
  xmlns:whc="http://www.oxygenxml.com/webhelp/components"
  xmlns="http://www.w3.org/1999/xhtml"    
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:html="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="#all" version="2.0">
  
  <xsl:import href="commonComponentsExpander.xsl"/>
  
  <xsl:template match="html:html" mode="copy_template">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:attribute name="lang" select="oxygen:getParameter('webhelp.language')"/>
      <xsl:attribute name="dir" select="oxygen:getParameter('webhelp.page.direction')"/>
      
      <!-- Copy elements -->
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="whc:webhelp_search_results" mode="copy_template">
    <xsl:variable name="webhelp_search_results">
      <xsl:choose>
        <xsl:when test="string-length($WEBHELP_SEARCH_SCRIPT) > 0 and string-length($WEBHELP_SEARCH_RESULT) > 0">
          <xsl:copy-of select="doc($WEBHELP_SEARCH_RESULT)"/>
        </xsl:when>
        <xsl:when test="string-length($WEBHELP_SEARCH_SCRIPT) > 0">
          <div class="gcse-searchresults-only" data-autoSearchOnLoad="true" data-queryParameterName="searchQuery"></div>
        </xsl:when>
        <xsl:otherwise>
          <div>
            <xsl:call-template name="generateComponentClassAttribute">
              <xsl:with-param name="compClass">wh_search_results</xsl:with-param>
            </xsl:call-template>
            <xsl:copy-of select="@* except @class"/>
            <xsl:call-template name="generateSearchPreloader"/>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:call-template name="outputComponentContent">
      <xsl:with-param name="compContent" select="$webhelp_search_results"/>
      <xsl:with-param name="compName" select="local-name()"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="generateSearchPreloader">
    <div class="searchPreload">
      <ul>
        <xsl:for-each select="1 to 3">
          <li>
            <div class="fakeResult">
              <div class="fakeTitle"><!-- --></div>
              <div class="fakeText"><!-- --></div>
              <div class="fakeText"><!-- --></div>
              <div class="fakeText"><!-- --></div>
            </div>
          </li>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:template>
</xsl:stylesheet>