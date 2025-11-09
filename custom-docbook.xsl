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

  <!-- Template to handle dbhtml-include processing instruction -->
  <xsl:template match="processing-instruction('dbhtml-include')">
    <xsl:variable name="href">
      <xsl:call-template name="pi-attribute">
        <xsl:with-param name="pis" select="."/>
        <xsl:with-param name="attribute">href</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$href != ''">
      <xsl:choose>
        <xsl:when test="$href = 'getting-started-help.html'">
          <xsl:text disable-output-escaping="yes"><![CDATA[
<button class="help-button page-help-button" onclick="openHelpPanel('Getting Started Help', `
  <h4>About This Chapter</h4>
  <p>This chapter covers the essential first steps to start using the product.</p>

  <div class='tip'>
    <strong>Tip:</strong> Follow the sections in order for the best learning experience.
  </div>

  <h4>Quick Navigation</h4>
  <ul>
    <li><a href='#what-is-product'>What is This Product?</a></li>
    <li><a href='#installation'>Installation and Setup</a></li>
    <li><a href='#quickstart'>Quick Start Tutorial</a></li>
  </ul>

  <h4>Prerequisites</h4>
  <p>Before starting, ensure you have:</p>
  <ul>
    <li>Administrator access to your system</li>
    <li>Basic familiarity with command-line tools</li>
    <li>An active internet connection</li>
  </ul>
`)">Help</button>
          ]]></xsl:text>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

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

  <!-- user.footer.content - DO NOT close main-content here, we'll do it in footer.navigation -->
  <xsl:template name="user.footer.content">
    <xsl:text disable-output-escaping="yes"><![CDATA[
    <!-- Help Panel Container -->
    <div class="help-overlay" id="helpOverlay" onclick="closeHelpPanel()"></div>
    <div class="help-panel" id="helpPanel">
      <div class="help-panel-header">
        <h3 id="helpPanelTitle">Help</h3>
        <button class="help-panel-close" onclick="closeHelpPanel()" aria-label="Close help panel">&times;</button>
      </div>
      <div class="help-panel-content" id="helpPanelContent">
        <!-- Help content will be dynamically inserted here -->
      </div>
    </div>

    <!-- Help Panel JavaScript -->
    <script>
    function openHelpPanel(title, content) {
      const panel = document.getElementById('helpPanel');
      const overlay = document.getElementById('helpOverlay');
      const titleEl = document.getElementById('helpPanelTitle');
      const contentEl = document.getElementById('helpPanelContent');

      titleEl.textContent = title;
      contentEl.innerHTML = content;

      panel.classList.add('open');
      overlay.classList.add('active');
      document.body.style.overflow = 'hidden';
    }

    function closeHelpPanel() {
      const panel = document.getElementById('helpPanel');
      const overlay = document.getElementById('helpOverlay');

      panel.classList.remove('open');
      overlay.classList.remove('active');
      document.body.style.overflow = '';
    }

    // Close on Escape key
    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape') {
        closeHelpPanel();
      }
    });
    </script>]]></xsl:text>
  </xsl:template>

  <!-- Customize navigation text to show page titles instead of "Prev/Next" -->
  <xsl:param name="navig.showtitles">1</xsl:param>

  <!-- Custom navigation footer - AWS style simple text links -->
  <xsl:template name="footer.navigation">
    <xsl:param name="prev" select="/foo"/>
    <xsl:param name="next" select="/foo"/>
    <xsl:param name="nav.context"/>

    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>

    <xsl:if test="$suppress.navigation = '0' and $suppress.footer.navigation = '0'">
      <!-- Close main-content div before navigation -->
      <xsl:text disable-output-escaping="yes"><![CDATA[</div> <!-- Close main-content -->]]></xsl:text>

      <div class="navfooter">
        <xsl:if test="count($next)>0">
          <p class="nav-next">
            <xsl:text>Next topic: </xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:call-template name="href.target">
                  <xsl:with-param name="object" select="$next"/>
                </xsl:call-template>
              </xsl:attribute>
              <xsl:apply-templates select="$next" mode="object.title.markup"/>
            </a>
          </p>
        </xsl:if>

        <xsl:if test="count($prev)>0">
          <p class="nav-prev">
            <xsl:text>Previous topic: </xsl:text>
            <a>
              <xsl:attribute name="href">
                <xsl:call-template name="href.target">
                  <xsl:with-param name="object" select="$prev"/>
                </xsl:call-template>
              </xsl:attribute>
              <xsl:apply-templates select="$prev" mode="object.title.markup"/>
            </a>
          </p>
        </xsl:if>
      </div>
    </xsl:if>
  </xsl:template>


</xsl:stylesheet>
