<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:test="http://www.jenitennison.com/xslt/unit-test"
                xmlns:x="http://www.jenitennison.com/xslt/xspec"
                xmlns:__x="http://www.w3.org/1999/XSL/TransformAliasAlias"
                xmlns:pkg="http://expath.org/ns/pkg"
                xmlns:impl="urn:x-xspec:compile:xslt:impl"
                xmlns:functx="http://www.functx.com"
                version="2.0"
                exclude-result-prefixes="pkg impl">
   <xsl:import href="file:/home/ext-cmarchand/devel/github/tests-xspec/src/main/xsl/escape-for-regex.xslt"/>
   <xsl:import href="file:/home/ext-cmarchand/devel/github/xspec/src/compiler/generate-tests-utils.xsl"/>
   <xsl:import href="file:/home/ext-cmarchand/devel/github/xspec/src/schematron/sch-location-compare.xsl"/>
   <xsl:namespace-alias stylesheet-prefix="__x" result-prefix="xsl"/>
   <xsl:variable name="x:stylesheet-uri"
                 as="xs:string"
                 select="'file:/home/ext-cmarchand/devel/github/tests-xspec/src/main/xsl/escape-for-regex.xslt'"/>
   <xsl:output name="x:report" method="xml" indent="yes"/>
   <xsl:template name="x:main">
      <xsl:message>
         <xsl:text>Testing with </xsl:text>
         <xsl:value-of select="system-property('xsl:product-name')"/>
         <xsl:text> </xsl:text>
         <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:message>
      <xsl:result-document format="x:report">
         <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="file:/home/ext-cmarchand/devel/github/xspec/src/compiler/format-xspec-report.xsl"</xsl:processing-instruction>
         <x:report stylesheet="{$x:stylesheet-uri}" date="{current-dateTime()}">
            <xsl:call-template name="x:d5e4"/>
            <xsl:call-template name="x:d5e11"/>
            <xsl:call-template name="x:d5e29"/>
         </x:report>
      </xsl:result-document>
   </xsl:template>
   <xsl:template name="x:d5e4">
      <xsl:message>No escaping</xsl:message>
      <x:scenario>
         <x:label>No escaping</x:label>
         <x:call function="functx:escape-for-regex">
            <x:param select="'Hello'"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable select="'Hello'" name="d6e1"/>
            <xsl:sequence select="functx:escape-for-regex($d6e1)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e9">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e9">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Must not be escaped at all</xsl:message>
      <xsl:variable select="'Hello'" name="impl:expected"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>Must not be escaped at all</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e11">
      <xsl:message>Test simple patterns</xsl:message>
      <x:scenario>
         <x:label>Test simple patterns</x:label>
         <xsl:call-template name="x:d5e13"/>
         <xsl:call-template name="x:d5e20"/>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e13">
      <xsl:message>..When encountering parentheses</xsl:message>
      <x:scenario>
         <x:label>When encountering parentheses</x:label>
         <x:call function="functx:escape-for-regex">
            <x:param name="arg" select="'(Hello)'"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable select="'(Hello)'" name="arg"/>
            <xsl:sequence select="functx:escape-for-regex($arg)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e18">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e18">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>escape them.</xsl:message>
      <xsl:variable select="'\(Hello\)'" name="impl:expected"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>escape them.</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e20">
      <xsl:message>..When encountering a whitespace character class</xsl:message>
      <x:scenario>
         <x:label>When encountering a whitespace character class</x:label>
         <x:call function="functx:escape-for-regex">
            <x:param name="arg" select="'\sHello'"/>
         </x:call>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable select="'\sHello'" name="arg"/>
            <xsl:sequence select="functx:escape-for-regex($arg)"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e25">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e27">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e25">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>escape the backslash</xsl:message>
      <xsl:variable select="'\\sHello'" name="impl:expected"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>escape the backslash</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e27">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>result should have one more character than source</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="string-length(.) = 8" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="string-length(.) = 8" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>result should have one more character than source</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e29">
      <xsl:message>When processing a list of phrases</xsl:message>
      <x:scenario>
         <x:label>When processing a list of phrases</x:label>
         <x:context>
            <phrases>
               <phrase>
                  <xsl:text>Hello!</xsl:text>
               </phrase>
               <phrase>
                  <xsl:text>Goodbye!</xsl:text>
               </phrase>
               <phrase>
                  <xsl:text>(So long!)</xsl:text>
               </phrase>
            </phrases>
         </x:context>
         <xsl:variable name="x:result" as="item()*">
            <xsl:variable name="impl:context-doc" as="document-node()">
               <xsl:document>
                  <phrases>
                     <phrase>
                        <xsl:text>Hello!</xsl:text>
                     </phrase>
                     <phrase>
                        <xsl:text>Goodbye!</xsl:text>
                     </phrase>
                     <phrase>
                        <xsl:text>(So long!)</xsl:text>
                     </phrase>
                  </phrases>
               </xsl:document>
            </xsl:variable>
            <xsl:variable name="impl:context" select="$impl:context-doc/node()"/>
            <xsl:apply-templates select="$impl:context"/>
         </xsl:variable>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$x:result"/>
            <xsl:with-param name="wrapper-name" select="'x:result'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e40">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
         <xsl:call-template name="x:d5e41">
            <xsl:with-param name="x:result" select="$x:result"/>
         </xsl:call-template>
      </x:scenario>
   </xsl:template>
   <xsl:template name="x:d5e40">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>All phrase elements should remain</xsl:message>
      <xsl:variable name="impl:expected" select="()"/>
      <xsl:variable name="impl:test-items" as="item()*">
         <xsl:choose>
            <xsl:when test="$x:result instance of node()+">
               <xsl:variable name="impl:test-items-doc">
                  <xsl:sequence select="$x:result"/>
               </xsl:variable>
               <xsl:sequence select="$impl:test-items-doc treat as document-node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="$x:result"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:test-result" as="item()*">
         <xsl:choose>
            <xsl:when test="count($impl:test-items) eq 1">
               <xsl:for-each select="$impl:test-items">
                  <xsl:sequence select="count(phrases/phrase) = 3" version="2"/>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="count(phrases/phrase) = 3" version="2"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="impl:boolean-test"
                    as="xs:boolean"
                    select="$impl:test-result instance of xs:boolean"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="if ($impl:boolean-test) then $impl:test-result cast as xs:boolean                     else test:deep-equal($impl:expected, $impl:test-result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>All phrase elements should remain</x:label>
         <xsl:if test="not($impl:boolean-test)">
            <xsl:call-template name="test:report-value">
               <xsl:with-param name="value" select="$impl:test-result"/>
               <xsl:with-param name="wrapper-name" select="'x:result'"/>
               <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
   <xsl:template name="x:d5e41">
      <xsl:param name="x:result" required="yes"/>
      <xsl:message>Strings should be escaped and status attributes should be added</xsl:message>
      <xsl:variable name="impl:expected-doc" as="document-node()">
         <xsl:document>
            <phrases>
               <phrase status="same">
                  <xsl:text>Hello!</xsl:text>
               </phrase>
               <phrase status="same">
                  <xsl:text>Goodbye!</xsl:text>
               </phrase>
               <phrase status="changed">
                  <xsl:text>\(So long!\)</xsl:text>
               </phrase>
            </phrases>
         </xsl:document>
      </xsl:variable>
      <xsl:variable name="impl:expected" select="$impl:expected-doc/node()"/>
      <xsl:variable name="impl:successful"
                    as="xs:boolean"
                    select="test:deep-equal($impl:expected, $x:result, 2)"/>
      <xsl:if test="not($impl:successful)">
         <xsl:message>      FAILED</xsl:message>
      </xsl:if>
      <x:test successful="{$impl:successful}">
         <x:label>Strings should be escaped and status attributes should be added</x:label>
         <xsl:call-template name="test:report-value">
            <xsl:with-param name="value" select="$impl:expected"/>
            <xsl:with-param name="wrapper-name" select="'x:expect'"/>
            <xsl:with-param name="wrapper-ns" select="'http://www.jenitennison.com/xslt/xspec'"/>
         </xsl:call-template>
      </x:test>
   </xsl:template>
</xsl:stylesheet>
