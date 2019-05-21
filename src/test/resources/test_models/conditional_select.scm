<?xml version="1.0" encoding="UTF-8"?>
<model name="conditional_select">
  <header formatversion="2" hwxversion="2019.2" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value="pablo"/>
      <property name="creationdate" value="05/20/19 15:20:30"/>
      <property name="revision" value="0"/>
      <property name="lastmodifieddate" value="05/21/19 08:39:24"/>
      <property name="comments" value=""/>
    </properties>
  </edition>
  <initialization/>
  <finalization/>
  <diagram>
    <block name="ConditionalSelect" type="block">
      <template name="system/Routing/ConditionalSelect"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-68" y="-86"/>
        <size width="84" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="then y=u1" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="if u2&gt;=a" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="else y=u3" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="y" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="u2typ" value="&apos;double&apos;"/>
          <parameter name="rule" value="&apos;u2&gt;=a&apos;"/>
          <parameter name="thra" value="12"/>
          <parameter name="nzz" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Constant" type="block">
      <template name="system/SignalGenerators/Constant"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-194" y="-122.17118072509766"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">5</text>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="C" value="5"/>
          <parameter name="typ" value="&apos;double&apos;"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Constant_1" type="block">
      <template name="system/SignalGenerators/Constant"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-195" y="-40.991641998291016"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="C" value="1"/>
          <parameter name="typ" value="&apos;double&apos;"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Ramp" type="block">
      <template name="system/SignalGenerators/Ramp"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-276.9582061767578" y="-82"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/ramp.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/ramp.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="slope" value="1"/>
          <parameter name="startt" value="0"/>
          <parameter name="initout" value="0"/>
          <parameter name="zc" value="1"/>
        </section>
      </parameters>
    </block>
    <block name="Scope" type="block">
      <template name="system/SignalViewers/Scope"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="80" y="-4.033432960510249"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalViewers/scope.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalViewers/scope.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="&quot;&quot; &quot;&quot; &quot;&quot;" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="nin"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Main">
          <parameter name="nin" value="3"/>
          <parameter name="externalActivation" value="0"/>
          <parameter name="winSize" value="[400,400]"/>
          <parameter name="winPos" value="[300,300]"/>
          <parameter name="winNam" value="&apos;&apos;"/>
          <parameter name="winHidden" value="1"/>
          <parameter name="showAtEnd" value="0"/>
          <parameter name="option" value="&apos;Reuse&apos;"/>
        </section>
        <section name="Advanced">
          <parameter name="useSubplot" value="1"/>
          <parametertable name="win_s">
            <columns number="7">
              <parameter name="title" value="&apos;&apos;"/>
              <parameter name="reverseColor" value="0"/>
              <parameter name="grid" value="&apos;Coarse&apos;"/>
              <parameter name="xScale" value="&apos;linear&apos;"/>
              <parameter name="xRefresh" value="-1"/>
              <parameter name="yScale" value="&apos;linear&apos;"/>
              <parameter name="yInterval" value="[NaN,NaN]"/>
            </columns>
            <rows number="nin">
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>&apos;Coarse&apos;</value>
                <value>&apos;linear&apos;</value>
                <value>-1</value>
                <value>&apos;linear&apos;</value>
                <value>[NaN,NaN]</value>
              </row>
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>&apos;Coarse&apos;</value>
                <value>&apos;linear&apos;</value>
                <value>-1</value>
                <value>&apos;linear&apos;</value>
                <value>[NaN,NaN]</value>
              </row>
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>&apos;Coarse&apos;</value>
                <value>&apos;linear&apos;</value>
                <value>-1</value>
                <value>&apos;linear&apos;</value>
                <value>[NaN,NaN]</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="plotTitle" value="&apos;&apos;"/>
          <parameter name="plotColor" value="0"/>
          <parameter name="plotGrid" value="&apos;Coarse&apos;"/>
          <parameter name="xScale" value="&apos;linear&apos;"/>
          <parameter name="xRefresh" value="-1"/>
          <parameter name="yScale" value="&apos;linear&apos;"/>
          <parameter name="yInterval" value="[NaN,NaN]"/>
          <parametertable name="signals">
            <columns number="3">
              <parameter name="name" value="&apos;&apos;"/>
              <parameter name="color" value="0"/>
              <parameter name="marker" value="0"/>
            </columns>
            <rows number="nin">
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="ConditionalSelect_1" type="block">
      <template name="system/Routing/ConditionalSelect"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-68" y="-12"/>
        <size width="84" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="then y=u1" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="if u2&lt;a" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="else y=u3" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="y" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="u2typ" value="&apos;double&apos;"/>
          <parameter name="rule" value="&apos;u2&lt;a&apos;"/>
          <parameter name="thra" value="5"/>
          <parameter name="nzz" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="ConditionalSelect_1_1" type="block">
      <template name="system/Routing/ConditionalSelect"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-66" y="57"/>
        <size width="84" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="then y=u1" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="if u2~=a" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="else y=u3" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="y" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="u2typ" value="&apos;double&apos;"/>
          <parameter name="rule" value="&apos;u2~=a&apos;"/>
          <parameter name="thra" value="12"/>
          <parameter name="nzz" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Split" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-107" y="-20.991641402244568"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Constant_1_1" type="block">
      <template name="system/SignalGenerators/Constant"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-193.99163818359375" y="29.077232897281647"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">3</text>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="C" value="3"/>
          <parameter name="typ" value="&apos;double&apos;"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Block" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-114.99364471435547" y="49.07723289728165"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Block_1" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-144" y="-78.04379272460938"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Block_2" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-133.29551696777344" y="-62"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Block_3" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-131.81312561035156" y="12"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Scope_1" type="block">
      <template name="system/SignalViewers/Scope"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="67.60572052001953" y="132.29159545898438"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalViewers/scope.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalViewers/scope.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="&quot;&quot;" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="nin"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Main">
          <parameter name="nin" value="1"/>
          <parameter name="externalActivation" value="0"/>
          <parameter name="winSize" value="[400,400]"/>
          <parameter name="winPos" value="[300,300]"/>
          <parameter name="winNam" value="&apos;&apos;"/>
          <parameter name="winHidden" value="1"/>
          <parameter name="showAtEnd" value="0"/>
          <parameter name="option" value="&apos;Reuse&apos;"/>
        </section>
        <section name="Advanced">
          <parameter name="useSubplot" value="1"/>
          <parametertable name="win_s">
            <columns number="7">
              <parameter name="title" value="&apos;&apos;"/>
              <parameter name="reverseColor" value="0"/>
              <parameter name="grid" value="&apos;Coarse&apos;"/>
              <parameter name="xScale" value="&apos;linear&apos;"/>
              <parameter name="xRefresh" value="-1"/>
              <parameter name="yScale" value="&apos;linear&apos;"/>
              <parameter name="yInterval" value="[NaN,NaN]"/>
            </columns>
            <rows number="nin">
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>&apos;Coarse&apos;</value>
                <value>&apos;linear&apos;</value>
                <value>-1</value>
                <value>&apos;linear&apos;</value>
                <value>[NaN,NaN]</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="plotTitle" value="&apos;&apos;"/>
          <parameter name="plotColor" value="0"/>
          <parameter name="plotGrid" value="&apos;Coarse&apos;"/>
          <parameter name="xScale" value="&apos;linear&apos;"/>
          <parameter name="xRefresh" value="-1"/>
          <parameter name="yScale" value="&apos;linear&apos;"/>
          <parameter name="yInterval" value="[NaN,NaN]"/>
          <parametertable name="signals">
            <columns number="3">
              <parameter name="name" value="&apos;&apos;"/>
              <parameter name="color" value="0"/>
              <parameter name="marker" value="0"/>
            </columns>
            <rows number="nin">
              <row>
                <value>&apos;&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="ConditionalSelect_1_1_1" type="block">
      <template name="system/Routing/ConditionalSelect"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-80.07218647003174" y="130.33038330078125"/>
        <size width="84" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="then y=u1" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="if u2==true" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="else y=u3" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="y" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="activation"/>
            <property name="portnumber" value="externalActivation"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="u2typ" value="&apos;double&apos;"/>
          <parameter name="rule" value="&apos;u2==true&apos;"/>
          <parameter name="thra" value="12"/>
          <parameter name="nzz" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Step Generator" type="block">
      <template name="system/SignalGenerators/StepGenerator"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-237.7480926513672" y="134.1439208984375"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/stepGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/stepGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="steptime" value="15"/>
          <parameter name="iniv" value="true"/>
          <parameter name="finv" value="false"/>
        </section>
      </parameters>
    </block>
    <block name="Block_4" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-130.3455352783203" y="81"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Block_5" type="regular_split">
      <template name="system/Links/Split"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="64,64,64,255"/>
        <position x="-143.67813110351563" y="97"/>
        <size width="0" height="0"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Ramp" port="1" iotype="out"/>
      <to block="Block_2" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Constant_1" port="1" iotype="out"/>
      <to block="Split" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Constant" port="1" iotype="out"/>
      <to block="Block_1" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1" port="1" iotype="in"/>
      <to block="Split" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-107" y="-4"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="1" iotype="out"/>
      <to block="ConditionalSelect" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-107" y="-46"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Constant_1_1" port="1" iotype="out"/>
      <to block="Block" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1" port="1" iotype="in"/>
      <to block="Block" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-114.99364471435547" y="65"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="1" iotype="out"/>
      <to block="ConditionalSelect_1" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-110.99581909179688" y="49.07723289728165"/>
        <point x="-110.99581909179688" y="28"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1" port="3" iotype="in"/>
      <to block="Block_5" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="1" iotype="out"/>
      <to block="ConditionalSelect" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-144" y="-78"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect" port="1" iotype="out"/>
      <to block="Scope" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="48" y="-62"/>
        <point x="48" y="2.6332337061564175"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Scope" port="2" iotype="in"/>
      <to block="ConditionalSelect_1" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="48" y="15.966567039489751"/>
        <point x="48" y="12"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Scope" port="3" iotype="in"/>
      <to block="ConditionalSelect_1_1" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="49" y="29.299900372823082"/>
        <point x="49" y="81"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1" port="2" iotype="in"/>
      <to block="Block_3" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_2" port="1" iotype="out"/>
      <to block="ConditionalSelect" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1" port="2" iotype="in"/>
      <to block="Block_4" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_3" port="1" iotype="in"/>
      <to block="Block_2" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-133.29551696777344" y="12"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1_1" port="1" iotype="out"/>
      <to block="Scope_1" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="35.7667670249939" y="154.33038330078125"/>
        <point x="35.7667670249939" y="152.29159545898438"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1_1" port="2" iotype="in"/>
      <to block="Step Generator" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-138.91013956069946" y="154.33038330078125"/>
        <point x="-138.91013956069946" y="154.1439208984375"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1_1" port="1" iotype="in"/>
      <to block="Block_4" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-130.3455352783203" y="138.33038330078125"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_4" port="1" iotype="in"/>
      <to block="Block_3" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-131.81312561035156" y="81"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ConditionalSelect_1_1_1" port="3" iotype="in"/>
      <to block="Block_5" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-143.67813110351563" y="170.33038330078125"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_5" port="1" iotype="in"/>
      <to block="Block_1" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-144" y="97"/>
      </points>
    </link>
    <context/>
    <graphics>
      <viewport width="800" height="800" topleftx="0" toplefty="0"/>
      <window width="800" height="800" topleftx="0" toplefty="0"/>
    </graphics>
  </diagram>
  <simulation>
    <properties>
      <property name="InitialTime" value="0"/>
      <property name="FinalTime" value="30"/>
      <property name="RealTimeScale" value="0"/>
      <property name="AbsoluteErrorTolerance" value="0.000001"/>
      <property name="RelativeErrorTolerance" value="0.000001"/>
      <property name="MaxTimeInterval" value="-1"/>
      <property name="TimeTolerance" value="-1"/>
      <property name="Solver" value="lsodar"/>
      <property name="MaxStepSize" value="-1"/>
      <property name="InitialStepSize" value="-1"/>
      <property name="MinimalStepSize" value="-1"/>
      <property name="ZeroCrossingThreshold" value="-1"/>
      <property name="NumberOfConsecutiveZeroCrossing" value="-1"/>
      <property name="TimeToleranceZeroCrossing" value="-1"/>
      <property name="AlgebraicSolver" value="idacalc"/>
      <property name="JacobianMethod" value="1"/>
    </properties>
  </simulation>
</model>
