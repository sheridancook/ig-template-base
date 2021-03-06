<?xml version="1.0" encoding="UTF-8"?>
<!--
  - This process runs a QA check on the final IG, ensuring that elements required for publication are properly populated
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="http://hl7.org/fhir" xmlns="http://hl7.org/fhir" exclude-result-prefixes="f">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:include href="handleIssues.xslt"/>
  <xsl:template match="f:definition/f:resource[not(f:name)]">
    <xsl:call-template name="raiseIssue">
      <xsl:with-param name="severity">error</xsl:with-param>
      <xsl:with-param name="code">required</xsl:with-param>
      <xsl:with-param name="details">Unable to find name for the resource.  Names are mandatory to allow proper population of the artifact list.</xsl:with-param>
      <xsl:with-param name="location" select="concat('ImplementationGuide.definition.resource[', count(preceding::f:resource), ']')"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="f:definition/f:resource[not(f:description)]">
    <xsl:call-template name="raiseIssue">
      <xsl:with-param name="severity">warning</xsl:with-param>
      <xsl:with-param name="code">invariant</xsl:with-param>
      <xsl:with-param name="details">Unable to find description for the resource.  Descriptions are strongly encouraged to allow proper population of the artifact list.</xsl:with-param>
      <xsl:with-param name="location" select="concat('ImplementationGuide.definition.resource[', count(preceding::f:resource), ']')"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>  