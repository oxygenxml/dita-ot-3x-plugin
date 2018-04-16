<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns:t="http://www.oxygenxml.com/ns/webhelp/toc">
    
    <xsl:character-map name="json">
        <xsl:output-character character="&quot;" string="\&quot;"/>   
        <xsl:output-character character="\" string="\\"/>
        <xsl:output-character character="/" string='\/'/>
        <xsl:output-character character="&#9;" string='\t'/>
        <xsl:output-character character="&#10;" string='\n'/>
        <xsl:output-character character="&#13;" string='\r'/>
        <!-- WH-1580: Escape XML special chars -->
        <xsl:output-character character="&amp;" string='&amp;amp;'/>
        <xsl:output-character character="&lt;" string='&amp;lt;'/>
        <xsl:output-character character="&gt;" string='&amp;gt;'/>
        <xsl:output-character character="&apos;" string='&amp;apos;'/>
    </xsl:character-map>
    
    <xsl:output name="json" method="text" use-character-maps="json" omit-xml-declaration="yes" />
    
    <xsl:template name="string-property">
        <xsl:param name="name"/>
        <xsl:param name="value"/>
        
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text disable-output-escaping="yes">":"</xsl:text>
        
        <xsl:call-template name="value">
            <xsl:with-param name="value" select="$value"/>
        </xsl:call-template>
        
        <xsl:text disable-output-escaping="yes">",</xsl:text>
    </xsl:template>
    
    <xsl:template name="boolean-property">
        <xsl:param name="name"/>
        <xsl:param name="value" as="xs:boolean"/>
        
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text disable-output-escaping="yes">":</xsl:text>
        <xsl:value-of select="$value"/>
        <xsl:text disable-output-escaping="yes">,</xsl:text>
    </xsl:template>
    
    <xsl:template name="object-property">
        <xsl:param name="name"/>
        <xsl:param name="value"/>
        
        <xsl:text disable-output-escaping="yes">"</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text disable-output-escaping="yes">": {</xsl:text>
        <!-- Already escaped -->
        <xsl:value-of select="$value" disable-output-escaping="yes"/>
        <xsl:text disable-output-escaping="yes">},</xsl:text>
    </xsl:template>
    
    <xsl:template name="value">
        <xsl:param name="value"/>
        <xsl:choose>
            <xsl:when test="$value instance of attribute() or $value instance of xs:string">
                <xsl:value-of select="$value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$value" mode="copy-value"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="*" mode="copy-value">
        <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:apply-templates select="@*" mode="copy-value"/>
        <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
        <xsl:apply-templates select="node()" mode="copy-value"/>
        <xsl:text disable-output-escaping="yes">&lt;/</xsl:text><xsl:value-of select="local-name()"/><xsl:text disable-output-escaping="yes">&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="@*" priority="10" mode="copy-value">
        <xsl:text> </xsl:text>
        <xsl:value-of select="local-name(.)"/>
        <xsl:text>="</xsl:text>
        <!-- WH-1580: Quotes from attribute values should be XML-escaped. -->
        <xsl:value-of select="replace(., '&quot;', '&amp;quot;')"/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" mode="copy-value">
        <xsl:text disable-output-escaping="yes">&lt;?</xsl:text><xsl:value-of select="node-name(.)"/><xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text disable-output-escaping="yes">?&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="comment()" mode="copy-value">
        <xsl:text disable-output-escaping="yes">&lt;!--</xsl:text><xsl:value-of select="."/><xsl:text disable-output-escaping="yes">--&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="text()" mode="copy-value">
        <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>