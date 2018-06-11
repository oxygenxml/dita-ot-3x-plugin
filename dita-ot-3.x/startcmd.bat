@echo off
REM Generated file, do not edit manually
echo "NOTE: The startcmd.bat has been deprecated, use the dita.bat command instead."
pause

REM Get the absolute path of DITAOT's home directory
set DITA_DIR=%~dp0

REM Set environment variables
set ANT_OPTS=-Xmx512m %ANT_OPTS%
set ANT_OPTS=%ANT_OPTS% -Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl
set ANT_HOME=%DITA_DIR%
set PATH=%DITA_DIR%\bin;%PATH%
set CLASSPATH=%DITA_DIR%lib;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\animal-sniffer-annotations-1.14.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\ant-apache-resolver-1.10.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\ant-apache-resolver-1.10.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\ant-launcher.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\ant.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\checker-qual-2.0.0.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\commons-io-2.6.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\dost-configuration.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\dost.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\error_prone_annotations-2.1.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\guava-25.1-jre.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\icu4j-61.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\j2objc-annotations-1.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\jsr305-3.0.2.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\logback-classic-1.2.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\logback-core-1.2.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\saxon-9.1.0.8-dom.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\saxon-9.1.0.8.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\slf4j-api-1.7.25.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\xercesImpl-2.11.0.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\xml-apis-1.4.01.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%lib\xml-resolver-1.2.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.common\lib\jaxb-api-2.3.0.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.common\lib\jaxb-core-2.3.0.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.common\lib\jaxb-impl-2.3.0.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.common\lib\activation-1.1.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.common\lib\ant-contrib-1.0b3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.dost.patches\lib\oxygen-dost-patches.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\com.oxygenxml.highlight\lib\xslthl-2.1.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2\lib\fo.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.htmlhelp\lib\htmlhelp.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.axf\lib\axf.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\oxygen-patches-fop.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\oxygen-patches-batik.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\avalon-framework-api-4.3.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\avalon-framework-impl-4.3.1.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\batik-all-1.10.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\fontbox-2.0.7.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\fop-2.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\jcl-over-slf4j-1.7.25.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\xml-apis-ext-1.3.04.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.fop\lib\xmlgraphics-commons-2.3.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.dita.pdf2.xep\lib\xep.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\org.lwdita-2.0.5.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\htmlparser-1.4.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-profile-pegdown-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-abbreviation-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-anchorlink-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-aside-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-autolink-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-definition-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-html-parser-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-escaped-character-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-footnotes-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-jira-converter-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-youtrack-converter-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-gfm-strikethrough-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-gfm-tables-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-gfm-tasklist-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-jekyll-front-matter-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-jekyll-tag-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-ins-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-superscript-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-tables-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-toc-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-typographic-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-wikilink-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-ext-yaml-front-matter-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-formatter-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\flexmark-util-0.32.24.jar;%CLASSPATH%
set CLASSPATH=%DITA_DIR%plugins\org.lwdita\lib\autolink-0.6.0.jar;%CLASSPATH%
start "DITA-OT" cmd.exe
