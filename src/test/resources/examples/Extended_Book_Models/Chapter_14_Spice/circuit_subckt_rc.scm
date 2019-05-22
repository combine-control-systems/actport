<?xml version="1.0" encoding="UTF-8"?>
<model name="circuit_subckt_rc">
  <header formatversion="2" hwxversion="2019.0" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value=""/>
      <property name="creationdate" value="06/06/18 12:51:01"/>
      <property name="revision" value="0"/>
      <property name="lastmodifieddate" value="08/29/18 08:41:22"/>
      <property name="comments" value="Simple RC circuit made in Modelica and SpiceCustomBlock"/>
    </properties>
  </edition>
  <initialization/>
  <diagram>
    <block name="SpiceCustomBlock" type="block">
      <template name="system/CustomBlocks/SpiceCustomBlock"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="229,223,236,255"/>
        <position x="-1990.8489990234375" y="113.40922546386719"/>
        <size width="204" height="84"/>
        <rotate angle="0"/>
        <texts>
          <text name="text" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">Spice&#xA;Block</text>
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
        <port name="&quot;OUT&quot;" type="variableport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="nout+ncout"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="&quot;IN&quot;" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="nin"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="Frequency" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="acanalysis"/>
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
          <parameter name="code" value="[char(10),&apos;.SUBCKT RSUB IN OUT&apos;,char(10),&apos;R1 IN OUT 1k&apos;,char(10),&apos;.ENDS&apos;,char(10),char(10),&apos;x1 IN  OUT RSUB&apos;,char(10),char(10),&apos;C1 OUT 0 1n&apos;,char(10),char(10),&apos;.end&apos;,char(10)]"/>
          <parameter name="acanalysis" value="0"/>
          <parameter name="nin" value="1"/>
          <parameter name="inputs_names" value="{&apos;IN&apos;}"/>
          <parameter name="nout" value="1"/>
          <parameter name="outputs_names" value="{&apos;OUT&apos;}"/>
          <parameter name="ncout" value=""/>
          <parameter name="coutputs_names" value="{}"/>
          <parameter name="nfeedthrough" value="0"/>
        </section>
        <section name="Reporting">
          <parameter name="simloglevel" value="&apos;Warning&apos;"/>
          <parameter name="log_file_name" value="&apos;&apos;"/>
          <parameter name="result_file" value="&apos;&apos;"/>
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
        <position x="-1636.6120605468755" y="135.4092254638672"/>
        <size width="84" height="40"/>
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
        <port name="&quot;Input&quot; &quot;Spice&quot; &quot;Modelica&quot;" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="nin"/>
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
        <section name="Main">
          <parameter name="nin" value="3"/>
          <parameter name="externalActivation" value="0"/>
          <parameter name="winSize" value="[400,400]"/>
          <parameter name="winPos" value="[300,300]"/>
          <parameter name="winNam" value="&apos;&apos;"/>
          <parameter name="winHidden" value="0"/>
          <parameter name="showAtEnd" value="0"/>
          <parameter name="option" value="&apos;Reuse&apos;"/>
        </section>
        <section name="Advanced">
          <parameter name="useSubplot" value="0"/>
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
                <value>&apos;Input&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
              <row>
                <value>&apos;Spice&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
              <row>
                <value>&apos;Modelica&apos;</value>
                <value>0</value>
                <value>0</value>
              </row>
            </rows>
          </parametertable>
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
        <position x="-2114.128662109375" y="135.4092254638672"/>
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
          <parameter name="F" value="3000000"/>
          <parameter name="P" value="0"/>
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
        <position x="-2049.128662109375" y="155.4092254638672"/>
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
    <block name="Resistor" type="block">
      <template name="Modelica/Electrical/Analog/Basic/Resistor"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,255,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-1951.8590087890625" y="221.83889244628915"/>
        <size width="50" height="50"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,0" clip="0" x="0.495000" y="0.857500" rotate="1" visible="1" font="Arial,10" align="center">R=1000</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Basic/Resistor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Electrical/Analog/Basic/Resistor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="p" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="n" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
        <port name="heatPort" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="mo_useHeatPort"/>
          </properties>
          <graphics>
            <location position="right" x="0.5" y="1"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="191,0,0,255" thickness="1.5"/>
            <background color="191,0,0,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parameter name="mo_R" value="1000"/>
          <parameter name="mo_T_ref" value=""/>
          <parameter name="mo_alpha" value=""/>
          <parameter name="mo_useHeatPort" value="0"/>
          <parameter name="mo_T" value=""/>
          <parametertable name="mo_v">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_i">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_LossPower">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_T_heatPort">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_R_actual">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="Capacitor" type="block">
      <template name="Modelica/Electrical/Analog/Basic/Capacitor"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,0,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-1877.8773193359375" y="280.47532127929685"/>
        <size width="50" height="50"/>
        <rotate angle="90"/>
        <texts>
          <text name="text1" color="0,0,0,0" clip="0" x="0.500000" y="0.957500" rotate="1" visible="1" font="Arial,10" align="center">C=1E-9</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Basic/Capacitor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Electrical/Analog/Basic/Capacitor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="p" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="n" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parameter name="mo_C" value="1E-9"/>
          <parametertable name="mo_v">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>1</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_i">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="Ground" type="block">
      <template name="Modelica/Electrical/Analog/Basic/Ground"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,0,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-1951.8590087890625" y="349.02720116210935"/>
        <size width="50" height="50"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,10" align="center"/>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Basic/Ground_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Electrical/Analog/Basic/Ground_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="p" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top" x="0.5" y="0"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
      </parameters>
    </block>
    <block name="SignalVoltage" type="block">
      <template name="Modelica/Electrical/Analog/Sources/SignalVoltage"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,255,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-2015.2847900390616" y="264.1363725390639"/>
        <size width="50" height="50"/>
        <rotate angle="270"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,10" align="center"/>
          <text name="text2" color="0,0,255,0" clip="0" x="0.150000" y="0.494500" rotate="1" visible="1" font="Arial,10" align="center">+</text>
          <text name="text3" color="0,0,255,0" clip="0" x="0.850000" y="0.494500" rotate="1" visible="1" font="Arial,10" align="center">-</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Sources/SignalVoltage_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="1">
          <images>
            <image name="image2" file="Electrical/Analog/Sources/SignalVoltage_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="p" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="n" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
        <port name="v" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="top" x="0.5" y="0.25"/>
            <size width="10" height="10"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,0,127,255" thickness="1.5"/>
            <background color="0,0,127,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parametertable name="mo_v">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
          <parametertable name="mo_i">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="ImplicitSplit" type="implicit_split">
      <template name="system/Links/ImplicitSplit"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,255,255" thickness="1.5"/>
        <background color="0,0,255,255"/>
        <position x="-1926.8590087890625" y="339.1363625390625"/>
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
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="bottom"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="ToModelica" type="block">
      <template name="system/Interfaces/ToModelica"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-2054.1286621093745" y="255.58641815185533"/>
        <size width="10" height="9.999999999999915"/>
        <rotate angle="90"/>
        <texts>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
          <parameter name="value" value=""/>
        </section>
      </parameters>
    </block>
    <block name="FromModelica" type="block">
      <template name="system/Interfaces/FromModelica"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="pentagon" visible="1" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-1695.2749633789062" y="163.74255879720275"/>
        <size width="10" height="10"/>
        <rotate angle="0"/>
        <texts>
        </texts>
        <images>
          <image name="image1" file="" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
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
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="VoltageSensor" type="block">
      <template name="Modelica/Electrical/Analog/Sensors/VoltageSensor"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,0,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-1817.769775390625" y="264.1363725390639"/>
        <size width="50" height="50"/>
        <rotate angle="270"/>
        <texts>
          <text name="text1" color="0,0,0,0" clip="0" x="0.502500" y="0.843000" rotate="1" visible="1" font="Arial,10" align="center">V</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Sensors/VoltageSensor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="1">
          <images>
            <image name="image2" file="Electrical/Analog/Sensors/VoltageSensor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="p" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="n" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
        <port name="v" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="bottom" x="0.5" y="0.95"/>
            <size width="5" height="5"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,0,127,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parametertable name="mo_v">
            <columns number="2">
              <parameter name="fixed" value="0"/>
              <parameter name="start" value="0"/>
            </columns>
            <rows number="1">
              <row>
                <value>0</value>
                <value></value>
              </row>
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="Block_1" type="implicit_split">
      <template name="system/Links/ImplicitSplit"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,255,255" thickness="1.5"/>
        <background color="0,0,255,255"/>
        <position x="-1852.8773193359375" y="339.1363625390625"/>
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
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="bottom"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="Block_2" type="implicit_split">
      <template name="system/Links/ImplicitSplit"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,255,255" thickness="1.5"/>
        <background color="0,0,255,255"/>
        <position x="-1852.8773193359375" y="246.83889244628904"/>
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
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="3"/>
          </properties>
          <graphics>
            <location position="bottom"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="point" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
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
        <position x="-2048.863037109375" y="155.4092254638672"/>
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
      <from block="SineWaveGenerator" port="1" iotype="out"/>
      <to block="Block" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="1" iotype="out"/>
      <to block="SpiceCustomBlock" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SignalVoltage" port="1" iotype="out"/>
      <to block="ImplicitSplit" port="2" iotype="out"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="-1990.2847900390639" y="339.1363625390624"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ImplicitSplit" port="1" iotype="out"/>
      <to block="Ground" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SignalVoltage" port="1" iotype="in"/>
      <to block="Resistor" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="-1990.2847900390655" y="246.8388924462888"/>
      </points>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SignalVoltage" port="2" iotype="in"/>
      <to block="ToModelica" port="1" iotype="out"/>
      <pen shape="line" color="0,0,127,255" thickness="1.5"/>
      <points>
        <point x="-2049.128662109343" y="289.13637253906074"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="2" iotype="out"/>
      <to block="ToModelica" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="FromModelica" port="1" iotype="out"/>
      <to block="Scope" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Resistor" port="1" iotype="out"/>
      <to block="Block_2" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Capacitor" port="1" iotype="out"/>
      <to block="Block_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor" port="1" iotype="out"/>
      <to block="Block_1" port="2" iotype="out"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="-1792.769775390625" y="339.1363625390626"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="1" iotype="out"/>
      <to block="ImplicitSplit" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor" port="1" iotype="in"/>
      <to block="Block_2" port="2" iotype="out"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="-1792.769775390623" y="246.83889244628912"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_2" port="1" iotype="out"/>
      <to block="Capacitor" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor" port="2" iotype="out"/>
      <to block="FromModelica" port="1" iotype="in"/>
      <pen shape="line" color="0,0,127,255" thickness="1.5"/>
      <points>
        <point x="-1735.9240417480466" y="289.13637253906376"/>
        <point x="-1735.9240417480466" y="168.74255879720792"/>
      </points>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Scope" port="2" iotype="in"/>
      <to block="SpiceCustomBlock" port="1" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Scope" port="1" iotype="in"/>
      <to block="Block" port="2" iotype="out"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="-1693.2290039062505" y="142.07589213053348"/>
        <point x="-1693.2290039062493" y="95.33438110351554"/>
        <point x="-2048.863037109375" y="95.33438110351555"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="1" iotype="out"/>
      <to block="Split" port="1" iotype="in"/>
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
      <property name="FinalTime" value="10e-6"/>
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
