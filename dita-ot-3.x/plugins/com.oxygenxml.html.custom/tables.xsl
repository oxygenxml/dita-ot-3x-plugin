<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
  xmlns:table="http://dita-ot.sourceforge.net/ns/201007/dita-ot/table"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot">  
  <xsl:function name="table:is-row-header" as="xs:boolean">
    <xsl:param name="entry" as="element()"/>
    
    <xsl:sequence select="
      (table:get-current-table($entry)/@rowheader eq 'firstcol'
      and xs:integer($entry/@dita-ot:x) eq 1) or
      $entry/@scope='row'  or $entry/@scope='rowgroup'
      "/>
  </xsl:function>
  
  <xsl:template match="*[table:is-tbody-entry(.)][table:is-row-header(.)]">
    <th>
      <xsl:choose>
        <xsl:when test="@scope='rowgroup'">
          <xsl:attribute name="scope">rowgroup</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="scope">row</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="." mode="table:entry"/>
    </th>
  </xsl:template>
  
  <xsl:template match="*[table:is-thead-entry(.)]">
    <th>
      <xsl:choose>
        <xsl:when test="@scope='colgroup'">
          <xsl:attribute name="scope">colgroup</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="scope">col</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="." mode="table:entry"/>
    </th>
  </xsl:template>
</xsl:stylesheet>