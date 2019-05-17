<?xml version="1.0" encoding="UTF-8"?>
<model name="lookup_tables">
  <header formatversion="2" hwxversion="2019.2" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value="Stefan Larsson"/>
      <property name="creationdate" value="05/17/19 07:54:22"/>
      <property name="revision" value="0"/>
      <property name="lastmodifieddate" value="05/17/19 09:49:25"/>
      <property name="comments" value=""/>
    </properties>
  </edition>
  <initialization/>
  <finalization/>
  <diagram>
    <block name="LookupTable2D" type="block">
      <template name="system/LookupTables/LookupTable2D"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-453.9263610839844" y="-613.7542724609375"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="LookupTables/lookupTable2D.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="LookupTables/lookupTable2D.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
        <port name="r" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="c" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
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
          <parameter name="xx" value="[1,2,3,4]"/>
          <parameter name="yy" value="[1,2,3]"/>
          <parameter name="zz" value="[4,5,6; 16,19,20; 10,18,23; 6,3,-1]"/>
          <parameter name="Method" value="&apos;Bilinear interpolation&apos;"/>
          <parameter name="DoOutside" value="&apos;Hold&apos;"/>
          <parameter name="EventGen" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="LookupTable3D" type="block">
      <template name="system/LookupTables/LookupTable3D"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-461.6884460449219" y="-552.9822998046875"/>
        <size width="60" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="LookupTables/lookupTable3D.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="LookupTables/lookupTable3D.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
        <port name="u1" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="u2" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="u3" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="left"/>
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
          <parameter name="xx" value="[2,3]"/>
          <parameter name="yy" value="[1,2,3]"/>
          <parameter name="zz" value="[-2,-1,1,2]"/>
          <parameter name="ff" value="[-10,-8,-6,-4,-2,0,2,4,6,8,10,-110,-18,-16,-14,-12,10,12,14,16,81,110,12,4]"/>
          <parameter name="Method" value="&apos;Trilinear interpolation&apos;"/>
          <parameter name="DoOutside" value="&apos;Hold&apos;"/>
          <parameter name="EventGen" value="1"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="LookupTableND" type="block">
      <template name="system/LookupTables/LookupTableND"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-460.85418701171875" y="-496.23260498046875"/>
        <size width="60" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="LookupTables/lookupTableND.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="LookupTables/lookupTableND.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
        <port name="pd" type="variableport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="derivative"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="&quot;&quot;" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="nDims"/>
          </properties>
          <graphics>
            <location position="left"/>
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
          <parameter name="nDims" value="4"/>
          <parametertable name="dims">
            <columns number="1">
              <parameter name="dimi" value="[1,2]"/>
            </columns>
            <rows number="nDims">
              <row>
                <value>[2,3]</value>
              </row>
              <row>
                <value>[1,2,3]</value>
              </row>
              <row>
                <value>[-2,-1,1,2]</value>
              </row>
              <row>
                <value>[1,2]</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="ff" value="[-10,-8,-6,-4,-2,0,2,4,6,8,10,-110,-18,-16,-14,-12,10,12,14,16,81,110,12,4]"/>
          <parameter name="Method" value="&apos;Akima&apos;"/>
          <parameter name="DoOutside" value="&apos;Hold&apos;"/>
          <parameter name="derivative" value="0"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="SineWaveGenerator" type="block">
      <template name="system/SignalGenerators/SineWaveGenerator"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-554.9328002929688" y="-673.5382080078125"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
          <parameter name="M" value="1"/>
          <parameter name="F" value="1"/>
          <parameter name="P" value="0"/>
          <parameter name="offs" value="0"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="SineWaveGenerator_1" type="block">
      <template name="system/SignalGenerators/SineWaveGenerator"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-554.7473754882813" y="-603.4803466796875"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
          <parameter name="M" value="1"/>
          <parameter name="F" value="1"/>
          <parameter name="P" value="0.5"/>
          <parameter name="offs" value="0"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="SineWaveGenerator_2" type="block">
      <template name="system/SignalGenerators/SineWaveGenerator"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-554.1448364257813" y="-533.2138671875"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
          <parameter name="M" value="1"/>
          <parameter name="F" value="1"/>
          <parameter name="P" value="1"/>
          <parameter name="offs" value="0"/>
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
        <position x="-480.18199157714844" y="-653.5382080078125"/>
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
        <position x="-480.18199157714844" y="-603.7542724609375"/>
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
        <position x="-480.18199157704595" y="-546.3156331380193"/>
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
        <position x="-491.54931640625" y="-583.4803466796875"/>
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
        <position x="-502.603759765625" y="-513.2138671875"/>
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
        <position x="-491.54931640625" y="-532.9822387695313"/>
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
        <position x="-357.41278076171875" y="-651.8464660644531"/>
        <size width="60" height="168"/>
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
        <port name="&quot;&quot; &quot;&quot; &quot;&quot; &quot;&quot;" type="variableport">
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
          <parameter name="nin" value="4"/>
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
    <block name="SineWaveGenerator_2_1" type="block">
      <template name="system/SignalGenerators/SineWaveGenerator"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-554.3070678710938" y="-481.23260498046875"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="SignalGenerators/sineWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
          <parameter name="M" value="1"/>
          <parameter name="F" value="1"/>
          <parameter name="P" value="1.5"/>
          <parameter name="offs" value="0"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="1D-interpolation" type="block">
      <diagram>
        <block name="Output" type="regular_out_port">
          <template name="system/Ports/Output"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-264.9739074707031" y="-650.1542358398438"/>
            <size width="20" height="20"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
              <parameter name="insize" value="[-1;-2]"/>
              <parameter name="intyp" value="&apos;inherit&apos;"/>
            </section>
          </parameters>
        </block>
        <block name="Input" type="regular_in_port">
          <template name="system/Ports/Input"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-574.8170471191406" y="-652.2752075195313"/>
            <size width="20" height="20"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
              <parameter name="outsize" value="[-1;-2]"/>
              <parameter name="outtyp" value="&apos;inherit&apos;"/>
              <parameter name="dept" value="0"/>
            </section>
          </parameters>
        </block>
        <block name="Extrapolation Zero" type="block">
          <diagram>
            <block name="ZeroOrder Clamped" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.3804931640625" y="-511.8783264160156"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Clamped&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Natural" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-577.4949035644531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Natural&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Not_a_knot" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-649.1916809082031"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Not_a_knot&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Linear" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-717.4704895019531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Linear&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder nearest" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-786.3377075195313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(nearest)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder ceil" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-858.0344848632813"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(ceil)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder floor" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-926.3132934570313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(floor)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Zero&apos;"/>
                  <parameter name="Rightside" value="&apos;Zero&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="Input" type="regular_in_port">
              <template name="system/Ports/Input"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-620.844970703125" y="-706.0663452148438"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="outsize" value="[-1;-2]"/>
                  <parameter name="outtyp" value="&apos;inherit&apos;"/>
                  <parameter name="dept" value="0"/>
                </section>
              </parameters>
            </block>
            <block name="Output" type="regular_out_port">
              <template name="system/Ports/Output"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-250.71728515625" y="-712.5472412109375"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="insize" value="[-1;-2]"/>
                  <parameter name="intyp" value="&apos;inherit&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="Mux" type="block">
              <template name="system/Routing/Mux"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-311.9658203125" y="-731.8271484375"/>
                <size width="10" height="60"/>
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
                <port name="" type="variableport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="nin"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="nin" value="7"/>
                  <parametertable name="inports">
                    <columns number="1">
                      <parameter name="size" value="1"/>
                    </columns>
                    <rows number="nin">
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                    </rows>
                  </parametertable>
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
                <position x="-528.6062622070313" y="-836.4844970703125"/>
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
                <position x="-528.6062622070313" y="-767.3555908203125"/>
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
                <position x="-528.6062622070313" y="-696.0663452148438"/>
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
                <position x="-528.6062622070313" y="-629.1916809082031"/>
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
                <position x="-528.6062622070313" y="-557.4949035644531"/>
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
              <from block="Input" port="1" iotype="out"/>
              <to block="Block_1" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder floor" port="1" iotype="out"/>
              <to block="Mux" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-333.6092529296875" y="-906.3132934570313"/>
                <point x="-333.60925292968744" y="-727.5414341517859"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder ceil" port="1" iotype="out"/>
              <to block="Mux" port="2" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-353.7718505859375" y="-838.0344848632813"/>
                <point x="-353.7718505859375" y="-718.9700055803568"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder nearest" port="1" iotype="out"/>
              <to block="Mux" port="3" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-364.88677978515625" y="-766.3377075195313"/>
                <point x="-364.88677978515625" y="-710.3985770089286"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Linear" port="1" iotype="out"/>
              <to block="Mux" port="4" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-697.4704895019531"/>
                <point x="-365.35430908203125" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Not_a_knot" port="1" iotype="out"/>
              <to block="Mux" port="5" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-629.1916809082031"/>
                <point x="-365.35430908203125" y="-693.2557198660714"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Natural" port="1" iotype="out"/>
              <to block="Mux" port="6" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-355.2120361328125" y="-557.4949035644531"/>
                <point x="-355.2120361328124" y="-684.6842912946435"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Clamped" port="1" iotype="out"/>
              <to block="Mux" port="7" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-345.1307373046875" y="-491.8783264160156"/>
                <point x="-345.13073730468756" y="-676.1128627232141"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Mux" port="1" iotype="out"/>
              <to block="Output" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-260.71728515625" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="1" iotype="out"/>
              <to block="ZeroOrder floor" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-906.3132934570313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="2" iotype="out"/>
              <to block="ZeroOrder ceil" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-836.4844970703125"/>
                <point x="-498.2070007324219" y="-838.0344848632813"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="1" iotype="out"/>
              <to block="Split" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="2" iotype="out"/>
              <to block="ZeroOrder nearest" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-767.3555908203125"/>
                <point x="-498.2070007324219" y="-766.3377075195313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="1" iotype="out"/>
              <to block="Block" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="2" iotype="out"/>
              <to block="ZeroOrder Linear" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-697.4704895019531"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="3" iotype="out"/>
              <to block="Block_2" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="1" iotype="out"/>
              <to block="ZeroOrder Not_a_knot" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="2" iotype="out"/>
              <to block="Block_3" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="1" iotype="out"/>
              <to block="ZeroOrder Natural" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="2" iotype="out"/>
              <to block="ZeroOrder Clamped" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-491.8783264160156"/>
              </points>
            </link>
            <context/>
            <graphics>
              <viewport width="800" height="800" topleftx="0" toplefty="0"/>
              <window width="800" height="800" topleftx="0" toplefty="0"/>
            </graphics>
          </diagram>
          <properties>
            <property name="masked" value="0"/>
            <property name="inlinable" value="1"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-450.0245056152344" y="-797.7090911865234"/>
            <size width="40" height="40"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters title="new block definition">
            <callback>
              <pre/>
              <post/>
            </callback>
          </parameters>
        </block>
        <block name="Extrapolation Hold" type="block">
          <diagram>
            <block name="ZeroOrder Clamped" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.3804931640625" y="-511.8783264160156"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Clamped&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Natural" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-577.4949035644531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Natural&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Not_a_knot" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-649.1916809082031"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Not_a_knot&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Linear" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-717.4704895019531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Linear&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder nearest" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-786.3377075195313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(nearest)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder ceil" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-858.0344848632813"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(ceil)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder floor" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-926.3132934570313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(floor)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Hold&apos;"/>
                  <parameter name="Rightside" value="&apos;Hold&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="Mux" type="block">
              <template name="system/Routing/Mux"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-311.9658203125" y="-731.8271484375"/>
                <size width="10" height="60"/>
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
                <port name="" type="variableport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="nin"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
                    <size width="4.5" height="4.499999999999999"/>
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="nin" value="7"/>
                  <parametertable name="inports">
                    <columns number="1">
                      <parameter name="size" value="1"/>
                    </columns>
                    <rows number="nin">
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                    </rows>
                  </parametertable>
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
                <position x="-528.6062622070313" y="-836.4844970703125"/>
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
                <position x="-528.6062622070313" y="-767.3555908203125"/>
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
                <position x="-528.6062622070313" y="-696.0663452148438"/>
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
                <position x="-528.6062622070313" y="-629.1916809082031"/>
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
                <position x="-528.6062622070313" y="-557.4949035644531"/>
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
            <block name="Input" type="regular_in_port">
              <template name="system/Ports/Input"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-620.844970703125" y="-706.0663452148438"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="outsize" value="[-1;-2]"/>
                  <parameter name="outtyp" value="&apos;inherit&apos;"/>
                  <parameter name="dept" value="0"/>
                </section>
              </parameters>
            </block>
            <block name="Output" type="regular_out_port">
              <template name="system/Ports/Output"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-250.71728515625" y="-712.5472412109375"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="insize" value="[-1;-2]"/>
                  <parameter name="intyp" value="&apos;inherit&apos;"/>
                </section>
              </parameters>
            </block>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Input" port="1" iotype="out"/>
              <to block="Block_1" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder floor" port="1" iotype="out"/>
              <to block="Mux" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-333.6092529296875" y="-906.3132934570313"/>
                <point x="-333.60925292968744" y="-727.5414341517859"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder ceil" port="1" iotype="out"/>
              <to block="Mux" port="2" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-353.7718505859375" y="-838.0344848632813"/>
                <point x="-353.7718505859375" y="-718.9700055803568"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder nearest" port="1" iotype="out"/>
              <to block="Mux" port="3" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-364.88677978515625" y="-766.3377075195313"/>
                <point x="-364.88677978515625" y="-710.3985770089286"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Linear" port="1" iotype="out"/>
              <to block="Mux" port="4" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-697.4704895019531"/>
                <point x="-365.35430908203125" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Not_a_knot" port="1" iotype="out"/>
              <to block="Mux" port="5" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-629.1916809082031"/>
                <point x="-365.35430908203125" y="-693.2557198660714"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Natural" port="1" iotype="out"/>
              <to block="Mux" port="6" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-355.2120361328125" y="-557.4949035644531"/>
                <point x="-355.2120361328124" y="-684.6842912946435"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Clamped" port="1" iotype="out"/>
              <to block="Mux" port="7" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-345.1307373046875" y="-491.8783264160156"/>
                <point x="-345.13073730468756" y="-676.1128627232141"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Mux" port="1" iotype="out"/>
              <to block="Output" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-260.71728515625" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="1" iotype="out"/>
              <to block="ZeroOrder floor" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-906.3132934570313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="2" iotype="out"/>
              <to block="ZeroOrder ceil" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-836.4844970703125"/>
                <point x="-498.2070007324219" y="-838.0344848632813"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="1" iotype="out"/>
              <to block="Split" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="2" iotype="out"/>
              <to block="ZeroOrder nearest" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-767.3555908203125"/>
                <point x="-498.2070007324219" y="-766.3377075195313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="1" iotype="out"/>
              <to block="Block" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="2" iotype="out"/>
              <to block="ZeroOrder Linear" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-697.4704895019531"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="3" iotype="out"/>
              <to block="Block_2" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="1" iotype="out"/>
              <to block="ZeroOrder Not_a_knot" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="2" iotype="out"/>
              <to block="Block_3" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="1" iotype="out"/>
              <to block="ZeroOrder Natural" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="2" iotype="out"/>
              <to block="ZeroOrder Clamped" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-491.8783264160156"/>
              </points>
            </link>
            <context/>
            <graphics>
              <viewport width="800" height="800" topleftx="0" toplefty="0"/>
              <window width="800" height="800" topleftx="0" toplefty="0"/>
            </graphics>
          </diagram>
          <properties>
            <property name="masked" value="0"/>
            <property name="inlinable" value="1"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-449.2506103515625" y="-724.7305755615234"/>
            <size width="40" height="40"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters title="new block definition">
            <callback>
              <pre/>
              <post/>
            </callback>
          </parameters>
        </block>
        <block name="Extrapolation Linear" type="block">
          <diagram>
            <block name="ZeroOrder Clamped" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.3804931640625" y="-511.8783264160156"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Clamped&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Natural" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-577.4949035644531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Natural&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Not_a_knot" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-649.1916809082031"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Not_a_knot&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Linear" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-717.4704895019531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Linear&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder nearest" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-786.3377075195313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(nearest)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder ceil" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-858.0344848632813"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(ceil)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder floor" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-926.3132934570313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(floor)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="1"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Extrapolation&apos;"/>
                  <parameter name="Rightside" value="&apos;Extrapolation&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="Mux" type="block">
              <template name="system/Routing/Mux"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-311.9658203125" y="-731.8271484375"/>
                <size width="10" height="60"/>
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
                <port name="" type="variableport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="nin"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
                    <size width="4.5" height="4.499999999999999"/>
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="nin" value="7"/>
                  <parametertable name="inports">
                    <columns number="1">
                      <parameter name="size" value="1"/>
                    </columns>
                    <rows number="nin">
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                    </rows>
                  </parametertable>
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
                <position x="-528.6062622070313" y="-836.4844970703125"/>
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
                <position x="-528.6062622070313" y="-767.3555908203125"/>
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
                <position x="-528.6062622070313" y="-696.0663452148438"/>
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
                <position x="-528.6062622070313" y="-629.1916809082031"/>
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
                <position x="-528.6062622070313" y="-557.4949035644531"/>
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
            <block name="Input" type="regular_in_port">
              <template name="system/Ports/Input"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-620.844970703125" y="-706.0663452148438"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="outsize" value="[-1;-2]"/>
                  <parameter name="outtyp" value="&apos;inherit&apos;"/>
                  <parameter name="dept" value="0"/>
                </section>
              </parameters>
            </block>
            <block name="Output" type="regular_out_port">
              <template name="system/Ports/Output"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-250.71728515625" y="-712.5472412109375"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="insize" value="[-1;-2]"/>
                  <parameter name="intyp" value="&apos;inherit&apos;"/>
                </section>
              </parameters>
            </block>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Input" port="1" iotype="out"/>
              <to block="Block_1" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder floor" port="1" iotype="out"/>
              <to block="Mux" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-333.6092529296875" y="-906.3132934570313"/>
                <point x="-333.60925292968744" y="-727.5414341517859"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder ceil" port="1" iotype="out"/>
              <to block="Mux" port="2" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-353.7718505859375" y="-838.0344848632813"/>
                <point x="-353.7718505859375" y="-718.9700055803568"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder nearest" port="1" iotype="out"/>
              <to block="Mux" port="3" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-364.88677978515625" y="-766.3377075195313"/>
                <point x="-364.88677978515625" y="-710.3985770089286"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Linear" port="1" iotype="out"/>
              <to block="Mux" port="4" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-697.4704895019531"/>
                <point x="-365.35430908203125" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Not_a_knot" port="1" iotype="out"/>
              <to block="Mux" port="5" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-629.1916809082031"/>
                <point x="-365.35430908203125" y="-693.2557198660714"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Natural" port="1" iotype="out"/>
              <to block="Mux" port="6" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-355.2120361328125" y="-557.4949035644531"/>
                <point x="-355.2120361328124" y="-684.6842912946435"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Clamped" port="1" iotype="out"/>
              <to block="Mux" port="7" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-345.1307373046875" y="-491.8783264160156"/>
                <point x="-345.13073730468756" y="-676.1128627232141"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Mux" port="1" iotype="out"/>
              <to block="Output" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-260.71728515625" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="1" iotype="out"/>
              <to block="ZeroOrder floor" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-906.3132934570313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="2" iotype="out"/>
              <to block="ZeroOrder ceil" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-836.4844970703125"/>
                <point x="-498.2070007324219" y="-838.0344848632813"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="1" iotype="out"/>
              <to block="Split" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="2" iotype="out"/>
              <to block="ZeroOrder nearest" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-767.3555908203125"/>
                <point x="-498.2070007324219" y="-766.3377075195313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="1" iotype="out"/>
              <to block="Block" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="2" iotype="out"/>
              <to block="ZeroOrder Linear" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-697.4704895019531"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="3" iotype="out"/>
              <to block="Block_2" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="1" iotype="out"/>
              <to block="ZeroOrder Not_a_knot" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="2" iotype="out"/>
              <to block="Block_3" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="1" iotype="out"/>
              <to block="ZeroOrder Natural" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="2" iotype="out"/>
              <to block="ZeroOrder Clamped" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-491.8783264160156"/>
              </points>
            </link>
            <context/>
            <graphics>
              <viewport width="800" height="800" topleftx="0" toplefty="0"/>
              <window width="800" height="800" topleftx="0" toplefty="0"/>
            </graphics>
          </diagram>
          <properties>
            <property name="masked" value="0"/>
            <property name="inlinable" value="1"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-451.4674072265625" y="-649.1885833740234"/>
            <size width="40" height="40"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters title="new block definition">
            <callback>
              <pre/>
              <post/>
            </callback>
          </parameters>
        </block>
        <block name="Extrapolation Repeat" type="block">
          <diagram>
            <block name="ZeroOrder Clamped" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.3804931640625" y="-511.8783264160156"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Clamped&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Natural" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-577.4949035644531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Natural&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Not_a_knot" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-649.1916809082031"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Not_a_knot&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder Linear" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-458.7427978515625" y="-717.4704895019531"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;Linear&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder nearest" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-786.3377075195313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(nearest)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder ceil" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-858.0344848632813"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(ceil)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="ZeroOrder floor" type="block">
              <template name="system/LookupTables/LookupTable"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-457.8077392578125" y="-926.3132934570313"/>
                <size width="40" height="40"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
                </texts>
                <images>
                  <image name="image1" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
                </images>
                <flip value="0">
                  <images>
                    <image name="image2" file="LookupTables/lookupTable.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
                <port name="" type="fixedport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="1"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
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
                  <parameter name="xx" value="[-1,0.5,1,1.5,2.5]"/>
                  <parameter name="yy" value="[-6,-1,-3,3,-4]"/>
                  <parameter name="Method" value="&apos;ZeroOrder(floor)&apos;"/>
                  <parameter name="typ" value="&apos;double&apos;"/>
                  <parameter name="EventGen" value="0"/>
                  <parameter name="externalActivation" value="0"/>
                </section>
                <section name="Advanced">
                  <parameter name="Leftside" value="&apos;Repeat&apos;"/>
                  <parameter name="Rightside" value="&apos;Repeat&apos;"/>
                </section>
              </parameters>
            </block>
            <block name="Mux" type="block">
              <template name="system/Routing/Mux"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-311.9658203125" y="-731.8271484375"/>
                <size width="10" height="60"/>
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
                <port name="" type="variableport">
                  <properties>
                    <property name="iotype" value="in"/>
                    <property name="datatype" value="Explicit"/>
                    <property name="portnumber" value="nin"/>
                  </properties>
                  <graphics>
                    <location position="left"/>
                    <size width="4.5" height="4.499999999999999"/>
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                    <label visible="1" font="Arial,11" color="255,255,255,255"/>
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="nin" value="7"/>
                  <parametertable name="inports">
                    <columns number="1">
                      <parameter name="size" value="1"/>
                    </columns>
                    <rows number="nin">
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                      <row>
                        <value>1</value>
                      </row>
                    </rows>
                  </parametertable>
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
                <position x="-528.6062622070313" y="-836.4844970703125"/>
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
                <position x="-528.6062622070313" y="-767.3555908203125"/>
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
                <position x="-528.6062622070313" y="-696.0663452148438"/>
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
                <position x="-528.6062622070313" y="-629.1916809082031"/>
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
                <position x="-528.6062622070313" y="-557.4949035644531"/>
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
            <block name="Input" type="regular_in_port">
              <template name="system/Ports/Input"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-620.844970703125" y="-706.0663452148438"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="outsize" value="[-1;-2]"/>
                  <parameter name="outtyp" value="&apos;inherit&apos;"/>
                  <parameter name="dept" value="0"/>
                </section>
              </parameters>
            </block>
            <block name="Output" type="regular_out_port">
              <template name="system/Ports/Output"/>
              <properties>
                <property name="inlinable" value="0"/>
                <property name="masked" value="1"/>
                <property name="atomic" value="0"/>
              </properties>
              <graphics>
                <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
                <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
                <background color="255,255,255,255"/>
                <position x="-250.71728515625" y="-712.5472412109375"/>
                <size width="20" height="20"/>
                <rotate angle="0"/>
                <texts>
                  <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">1</text>
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
                    <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                    <background color="64,64,64,255"/>
                  </graphics>
                </port>
              </ports>
              <parameters>
                <section name="Parameters">
                  <parameter name="portNumber" value="1"/>
                  <parameter name="insize" value="[-1;-2]"/>
                  <parameter name="intyp" value="&apos;inherit&apos;"/>
                </section>
              </parameters>
            </block>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Input" port="1" iotype="out"/>
              <to block="Block_1" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder floor" port="1" iotype="out"/>
              <to block="Mux" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-333.6092529296875" y="-906.3132934570313"/>
                <point x="-333.60925292968744" y="-727.5414341517859"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder ceil" port="1" iotype="out"/>
              <to block="Mux" port="2" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-353.7718505859375" y="-838.0344848632813"/>
                <point x="-353.7718505859375" y="-718.9700055803568"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder nearest" port="1" iotype="out"/>
              <to block="Mux" port="3" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-364.88677978515625" y="-766.3377075195313"/>
                <point x="-364.88677978515625" y="-710.3985770089286"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Linear" port="1" iotype="out"/>
              <to block="Mux" port="4" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-697.4704895019531"/>
                <point x="-365.35430908203125" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Not_a_knot" port="1" iotype="out"/>
              <to block="Mux" port="5" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-365.35430908203125" y="-629.1916809082031"/>
                <point x="-365.35430908203125" y="-693.2557198660714"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Natural" port="1" iotype="out"/>
              <to block="Mux" port="6" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-355.2120361328125" y="-557.4949035644531"/>
                <point x="-355.2120361328124" y="-684.6842912946435"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="ZeroOrder Clamped" port="1" iotype="out"/>
              <to block="Mux" port="7" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-345.1307373046875" y="-491.8783264160156"/>
                <point x="-345.13073730468756" y="-676.1128627232141"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Mux" port="1" iotype="out"/>
              <to block="Output" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-260.71728515625" y="-701.8271484375"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="1" iotype="out"/>
              <to block="ZeroOrder floor" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-906.3132934570313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Split" port="2" iotype="out"/>
              <to block="ZeroOrder ceil" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-836.4844970703125"/>
                <point x="-498.2070007324219" y="-838.0344848632813"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="1" iotype="out"/>
              <to block="Split" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block" port="2" iotype="out"/>
              <to block="ZeroOrder nearest" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-498.2070007324219" y="-767.3555908203125"/>
                <point x="-498.2070007324219" y="-766.3377075195313"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="1" iotype="out"/>
              <to block="Block" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="2" iotype="out"/>
              <to block="ZeroOrder Linear" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-697.4704895019531"/>
              </points>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_1" port="3" iotype="out"/>
              <to block="Block_2" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="1" iotype="out"/>
              <to block="ZeroOrder Not_a_knot" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_2" port="2" iotype="out"/>
              <to block="Block_3" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="1" iotype="out"/>
              <to block="ZeroOrder Natural" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points/>
            </link>
            <link name="" type="Explicit">
              <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
              <from block="Block_3" port="2" iotype="out"/>
              <to block="ZeroOrder Clamped" port="1" iotype="in"/>
              <pen shape="line" color="64,64,64,255" thickness="1.5"/>
              <points>
                <point x="-528.6062622070313" y="-491.8783264160156"/>
              </points>
            </link>
            <context/>
            <graphics>
              <viewport width="800" height="800" topleftx="0" toplefty="0"/>
              <window width="800" height="800" topleftx="0" toplefty="0"/>
            </graphics>
          </diagram>
          <properties>
            <property name="masked" value="0"/>
            <property name="inlinable" value="1"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-449.4117736816406" y="-576.6373138427734"/>
            <size width="40" height="40"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters title="new block definition">
            <callback>
              <pre/>
              <post/>
            </callback>
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
            <position x="-502.4207763671875" y="-708.123046875"/>
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
            <position x="-502.4207763671875" y="-642.2752075195313"/>
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
            <position x="-502.4207763671875" y="-629.1885833740234"/>
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
        <block name="Mux" type="block">
          <template name="system/Routing/Mux"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="-308.8461608886719" y="-671.3119506835938"/>
            <size width="10" height="60"/>
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
            <port name="" type="variableport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="Explicit"/>
                <property name="portnumber" value="nin"/>
              </properties>
              <graphics>
                <location position="left"/>
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
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
                <label visible="1" font="Arial,11" color="255,255,255,255"/>
                <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
                <background color="64,64,64,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="nin" value="4"/>
              <parametertable name="inports">
                <columns number="1">
                  <parameter name="size" value="1"/>
                </columns>
                <rows number="nin">
                  <row>
                    <value>7</value>
                  </row>
                  <row>
                    <value>7</value>
                  </row>
                  <row>
                    <value>7</value>
                  </row>
                  <row>
                    <value>7</value>
                  </row>
                </rows>
              </parametertable>
            </section>
          </parameters>
        </block>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Input" port="1" iotype="out"/>
          <to block="Block" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Split" port="1" iotype="out"/>
          <to block="Extrapolation Zero" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-502.4207763671875" y="-777.7090911865234"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Split" port="2" iotype="out"/>
          <to block="Extrapolation Hold" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-480.835693359375" y="-708.123046875"/>
            <point x="-480.835693359375" y="-704.7305755615234"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Block" port="1" iotype="out"/>
          <to block="Split" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Block" port="2" iotype="out"/>
          <to block="Block_1" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Block_1" port="1" iotype="out"/>
          <to block="Extrapolation Linear" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Block_1" port="2" iotype="out"/>
          <to block="Extrapolation Repeat" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-502.4207763671875" y="-556.6373138427734"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Extrapolation Zero" port="1" iotype="out"/>
          <to block="Mux" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-332.4794616699219" y="-777.7090911865234"/>
            <point x="-332.4794616699219" y="-663.8119506835938"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Extrapolation Hold" port="1" iotype="out"/>
          <to block="Mux" port="2" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-359.0483856201172" y="-704.7305755615234"/>
            <point x="-359.0483856201172" y="-648.8119506835938"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Extrapolation Linear" port="1" iotype="out"/>
          <to block="Mux" port="3" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-360.1567840576172" y="-629.1885833740234"/>
            <point x="-360.1567840576172" y="-633.8119506835938"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Extrapolation Repeat" port="1" iotype="out"/>
          <to block="Mux" port="4" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-359.12896728515625" y="-556.6373138427734"/>
            <point x="-359.12896728515625" y="-618.8119506835938"/>
          </points>
        </link>
        <link name="" type="Explicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Mux" port="1" iotype="out"/>
          <to block="Output" port="1" iotype="in"/>
          <pen shape="line" color="64,64,64,255" thickness="1.5"/>
          <points>
            <point x="-281.9100341796875" y="-641.3119506835938"/>
            <point x="-281.9100341796875" y="-640.1542358398438"/>
          </points>
        </link>
        <context/>
        <graphics>
          <viewport width="800" height="800" topleftx="0" toplefty="0"/>
          <window width="800" height="800" topleftx="0" toplefty="0"/>
        </graphics>
      </diagram>
      <properties>
        <property name="masked" value="0"/>
        <property name="inlinable" value="1"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-454.8170471191406" y="-673.7467651367188"/>
        <size width="40" height="40"/>
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
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,11" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters title="new block definition">
        <callback>
          <pre/>
          <post/>
        </callback>
      </parameters>
    </block>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SineWaveGenerator" port="1" iotype="out"/>
      <to block="Split" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="1" iotype="out"/>
      <to block="1D-interpolation" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-464.8170471191406" y="-653.5382080078125"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="2" iotype="out"/>
      <to block="Block" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="1" iotype="out"/>
      <to block="LookupTable2D" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="2" iotype="out"/>
      <to block="Block_1" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="1" iotype="out"/>
      <to block="LookupTable3D" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="2" iotype="out"/>
      <to block="LookupTableND" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-480.18199157712047" y="-491.23260498046886"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SineWaveGenerator_1" port="1" iotype="out"/>
      <to block="Block_2" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_2" port="1" iotype="out"/>
      <to block="LookupTable2D" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-491.54931640625" y="-583.7542724609375"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_2" port="2" iotype="out"/>
      <to block="Block_4" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SineWaveGenerator_2" port="1" iotype="out"/>
      <to block="Block_3" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_3" port="1" iotype="out"/>
      <to block="LookupTable3D" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-502.6037597656154" y="-519.6489664713536"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_3" port="2" iotype="out"/>
      <to block="LookupTableND" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-502.60375976562636" y="-471.2326049804691"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_4" port="1" iotype="out"/>
      <to block="LookupTable3D" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_4" port="2" iotype="out"/>
      <to block="LookupTableND" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-491.5493164062506" y="-481.2326049804688"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="1D-interpolation" port="1" iotype="out"/>
      <to block="Scope" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-386.11491394043" y="-653.7467651367192"/>
        <point x="-386.1149139404297" y="-630.8464660644531"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="LookupTable2D" port="1" iotype="out"/>
      <to block="Scope" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-385.6695709228515" y="-593.7542724609375"/>
        <point x="-385.66957092285156" y="-588.8464660644531"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="LookupTable3D" port="1" iotype="out"/>
      <to block="Scope" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-378.2991638183594" y="-532.9822998046875"/>
        <point x="-378.2991638183594" y="-546.8464660644531"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="LookupTableND" port="1" iotype="out"/>
      <to block="Scope" port="4" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-378.29917907714844" y="-476.23260498046875"/>
        <point x="-378.29917907714844" y="-504.8464660644531"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SineWaveGenerator_2_1" port="1" iotype="out"/>
      <to block="LookupTableND" port="4" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
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
