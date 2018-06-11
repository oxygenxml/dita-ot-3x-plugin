<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="../util/jsonUtil.xsl"></xsl:import>

    <xsl:output method="text" use-character-maps="json" omit-xml-declaration="yes"></xsl:output>

    <xsl:variable name="allowed-webhelp-options"
        select="(
            'webhelp.topic.collapsible.elements.initial.state',
            'webhelp.search.ranking',
            'webhelp.top.menu.depth',
            'webhelp.show.main.page.tiles',
            'webhelp.show.main.page.toc',
            'webhelp.show.breadcrumb',
            'webhelp.show.navigation.links',
            'webhelp.show.print.link',
            'webhelp.show.expand.collapse.sections',
            'webhelp.show.indexterms.link',
            'webhelp.show.publication.toc',
            'webhelp.publication.toc.links',
            'webhelp.show.top.menu',
            'webhelp.show.related.links',
            'webhelp.merge.nested.topics.related.links',
            'webhelp.show.child.links',
            'webhelp.show.toggle.highlights',
            'webhelp.enable.search.autocomplete',
            'webhelp.publication.toc.tooltip.position',
            'webhelp.search.enable.pagination',
            'webhelp.search.page.numberOfItems',
            'webhelp.default.collection.type.sequence',
            'args.hide.parent.link',
            'use.stemming',
            'webhelp.sitemap.priority',
            'webhelp.sitemap.change.frequency',
            'default.language',
            'webhelp.show.changes.and.comments',
            'webhelp.enable.template.js.module.loading',
            (: Property computed in the build file. (This is not a scenario parameter) :)
            'webhelp.language',
            (: Property set by the publishing template task. (This is not a scenario parameter) :)
            'webhelp.js.module.rel.path'
            )"/>

    <xsl:template match="/properties">
        <xsl:text disable-output-escaping="yes">define({</xsl:text>
        <xsl:apply-templates select="property" mode="properties"></xsl:apply-templates>
        <xsl:text disable-output-escaping="yes">});</xsl:text>
    </xsl:template>

    <xsl:template match="property[@name = $allowed-webhelp-options]"
        mode="properties">
        <xsl:call-template name="string-property">
            <xsl:with-param name="name" select="@name"></xsl:with-param>
            <xsl:with-param name="value" select="@value"></xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="text()" mode="properties"></xsl:template>
</xsl:stylesheet>
