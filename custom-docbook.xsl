<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Import the standard DocBook HTML chunking stylesheet -->
  <xsl:import href="/opt/homebrew/Cellar/docbook-xsl/1.79.2_1/docbook-xsl/html/chunk.xsl"/>

  <!-- Customization parameters -->
  <xsl:param name="html.stylesheet">docs-style.css</xsl:param>
  <xsl:param name="chunk.section.depth">2</xsl:param>
  <xsl:param name="generate.toc">book toc,title</xsl:param>
  <xsl:param name="toc.section.depth">3</xsl:param>
  <xsl:param name="use.id.as.filename">1</xsl:param>

  <!-- Custom body attributes -->
  <xsl:template name="body.attributes">
    <xsl:attribute name="class">has-sidebar</xsl:attribute>
  </xsl:template>

  <!-- Custom header template with sidebar -->
  <xsl:template name="user.header.content">
    <xsl:variable name="home" select="/*[1]"/>
    <xsl:text disable-output-escaping="yes"><![CDATA[
    <div class="sidebar">
      <div class="sidebar-header">
        <h1>]]></xsl:text>
          <xsl:apply-templates select="$home" mode="object.title.markup.textonly"/>
    <xsl:text disable-output-escaping="yes"><![CDATA[</h1>]]></xsl:text>
        <xsl:if test="$home/bookinfo/subtitle">
    <xsl:text disable-output-escaping="yes"><![CDATA[
        <div class="subtitle">]]></xsl:text>
            <xsl:value-of select="$home/bookinfo/subtitle"/>
    <xsl:text disable-output-escaping="yes"><![CDATA[</div>]]></xsl:text>
        </xsl:if>
    <xsl:text disable-output-escaping="yes"><![CDATA[
      </div>
      <nav>
        <ul class="toc">]]></xsl:text>

    <!-- Generate TOC links -->
    <xsl:for-each select="$home/preface">
      <xsl:text disable-output-escaping="yes"><![CDATA[<li><a href="]]></xsl:text>
      <xsl:call-template name="href.target"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
      <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[</a></li>]]></xsl:text>
    </xsl:for-each>

    <xsl:for-each select="$home/chapter">
      <xsl:text disable-output-escaping="yes"><![CDATA[<li><a href="]]></xsl:text>
      <xsl:call-template name="href.target"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
      <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[</a>]]></xsl:text>

      <xsl:if test="section">
        <xsl:text disable-output-escaping="yes"><![CDATA[<ul>]]></xsl:text>
        <xsl:for-each select="section">
          <xsl:text disable-output-escaping="yes"><![CDATA[<li><a href="]]></xsl:text>
          <xsl:call-template name="href.target"/>
          <xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
          <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
          <xsl:text disable-output-escaping="yes"><![CDATA[</a></li>]]></xsl:text>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes"><![CDATA[</ul>]]></xsl:text>
      </xsl:if>

      <xsl:text disable-output-escaping="yes"><![CDATA[</li>]]></xsl:text>
    </xsl:for-each>

    <xsl:for-each select="$home/appendix">
      <xsl:text disable-output-escaping="yes"><![CDATA[<li><a href="]]></xsl:text>
      <xsl:call-template name="href.target"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
      <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
      <xsl:text disable-output-escaping="yes"><![CDATA[</a></li>]]></xsl:text>
    </xsl:for-each>

    <xsl:text disable-output-escaping="yes"><![CDATA[
        </ul>
      </nav>
    </div>
    <div class="main-content">]]></xsl:text>
  </xsl:template>

  <!-- Close the main-content div at the end -->
  <xsl:template name="user.footer.content">
    <xsl:text disable-output-escaping="yes"><![CDATA[
    </div> <!-- Close main-content -->]]></xsl:text>
  </xsl:template>


</xsl:stylesheet>
