<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="UTF-8"/>

  <!-- Identity template to copy all elements and attributes as is -->
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- For elements with "Benennung" attribute, keep the "Benennung" attribute -->
  <xsl:template match="*[@Benennung]">
    <xsl:copy>
      <xsl:attribute name="Benennung">
        <xsl:value-of select="@Benennung"/>
      </xsl:attribute>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>