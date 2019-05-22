<?xml version="1.0" encoding="UTF-8"?>
<model name="motor">
  <header formatversion="2" hwxversion="2019.0" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value="Altair Engineering Inc."/>
      <property name="creationdate" value="07/28/16 10:35:20"/>
      <property name="revision" value="0.0"/>
      <property name="lastmodifieddate" value="08/17/18 13:49:56"/>
      <property name="comments" value=""/>
    </properties>
  </edition>
  <initialization/>
  <diagram>
    <block name="DC Motor" type="block">
      <diagram>
        <block name="ImplicitInput" type="implicit_in_port">
          <template name="system/Ports/ImplicitInput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="171.616211" y="354.151917"/>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
            </section>
          </parameters>
        </block>
        <block name="ImplicitOutput" type="implicit_out_port">
          <template name="system/Ports/ImplicitOutput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="502.143891" y="418.823365"/>
            <size width="19.999999999999943" height="20"/>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
            </section>
          </parameters>
        </block>
        <block name="ImplicitInput_1" type="implicit_in_port">
          <template name="system/Ports/ImplicitInput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="170.534179" y="471.545899"/>
            <size width="20" height="20"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">2</text>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="2"/>
            </section>
          </parameters>
        </block>
        <block name="Resistor_1" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/Resistor"/>
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
            <position x="217.602967" y="339.151917"/>
            <size width="50.00000000000003" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,0" clip="0" x="0.495" y="0.817" rotate="1" visible="1" font="Arial,12" align="center">R=1</text>
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
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="variableport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="mo_useHeatPort"/>
              </properties>
              <graphics>
                <location position="right" x="0.5" y="1"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="191,0,0,255" thickness="1.5"/>
                <background color="191,0,0,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_R" value="1"/>
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
        <block name="Inductor_1" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/Inductor"/>
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
            <position x="299.960785" y="339.151917"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,0" clip="0" x="0.515" y="0.9245" rotate="1" visible="1" font="Arial,12" align="center">L=0.0001</text>
            </texts>
            <images>
              <image name="image1" file="Electrical/Analog/Basic/Inductor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Electrical/Analog/Basic/Inductor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_L" value="0.0001"/>
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
        <block name="EMF" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/EMF"/>
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
            <position x="329.960785" y="403.823365"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
              <text name="text2" color="160,160,164,0" clip="0" x="0.9725" y="0.2245" rotate="1" visible="1" font="Arial,12" align="center">k=1</text>
            </texts>
            <images>
              <image name="image1" file="Electrical/Analog/Basic/EMF_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Electrical/Analog/Basic/EMF_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="top" x="0.5" y="0"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="bottom" x="0.5" y="1"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="2"/>
              </properties>
              <graphics>
                <location position="right" x="1.001" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="variableport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="mo_useSupport"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="7.5" height="7.5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="192,192,192,255" thickness="1.5"/>
                <background color="192,192,192,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_useSupport" value="0"/>
              <parameter name="mo_k" value="1"/>
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
              <parametertable name="mo_phi">
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
              <parametertable name="mo_w">
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
        <block name="Inertia_1" type="block">
          <template name="Modelica 3.2.1/Mechanics/Rotational/Components/Inertia"/>
          <properties>
            <property name="masked" value="1"/>
            <property name="inlinable" value="0"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="0" color="64,64,64,0" thickness="1.5"/>
            <background color="255,255,255,0"/>
            <position x="397.276398" y="403.823365"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
              <text name="text2" color="0,0,0,0" clip="0" x="0.5" y="1.0465" rotate="1" visible="1" font="Arial,12" align="center">J=1</text>
            </texts>
            <images>
              <image name="image1" file="Mechanics/Rotational/Components/Inertia_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Mechanics/Rotational/Components/Inertia_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="95,95,95,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1.001" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_J" value="1"/>
              <parametertable name="mo_phi">
                <columns number="2">
                  <parameter name="fixed" value="0"/>
                  <parameter name="start" value="0"/>
                </columns>
                <rows number="1">
                  <row>
                    <value>0</value>
                    <value>0</value>
                  </row>
                </rows>
              </parametertable>
              <parametertable name="mo_w">
                <columns number="2">
                  <parameter name="fixed" value="0"/>
                  <parameter name="start" value="0"/>
                </columns>
                <rows number="1">
                  <row>
                    <value>0</value>
                    <value>0</value>
                  </row>
                </rows>
              </parametertable>
              <parametertable name="mo_a">
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
            <section name="Advanced">
              <parametercombobox name="mo_stateSelect">
                <parameter name="choice1" value="1"/>
                <parameter name="choice2" value="0"/>
                <parameter name="choice3" value="0"/>
                <parameter name="choice4" value="0"/>
                <parameter name="choice5" value="0"/>
              </parametercombobox>
            </section>
          </parameters>
        </block>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Resistor_1" port="1" iotype="out"/>
          <to block="Inductor_1" port="1" iotype="in"/>
          <pen shape="line" color="0,0,255,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Inductor_1" port="1" iotype="out"/>
          <to block="EMF" port="1" iotype="in"/>
          <pen shape="line" color="0,0,255,255" thickness="1.5"/>
          <points>
            <point x="354.960785" y="364.151917"/>
          </points>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="EMF" port="2" iotype="out"/>
          <to block="Inertia_1" port="1" iotype="in"/>
          <pen shape="line" color="0,0,0,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="ImplicitInput" port="1" iotype="out"/>
          <to block="Resistor_1" port="1" iotype="in"/>
          <pen shape="line" color="0,15,142,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Inertia_1" port="1" iotype="out"/>
          <to block="ImplicitOutput" port="1" iotype="in"/>
          <pen shape="line" color="0,0,0,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="ImplicitInput_1" port="1" iotype="out"/>
          <to block="EMF" port="1" iotype="out"/>
          <pen shape="line" color="0,15,142,255" thickness="1.5"/>
          <points>
            <point x="354.960785" y="481.545899"/>
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
        <frame shape="rectangle" visible="0" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="89.58836158593749" y="278.40869207617186"/>
        <size width="48" height="36"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="dcmotoricon.PNG" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="dcmotoricon.PNG" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
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
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
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
    <block name="Block" type="implicit_split">
      <template name="system/Links/ImplicitSplit"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="0,0,0,255"/>
        <position x="174.7094115859375" y="296.40869207617186"/>
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
            <frame shape="point" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="0,0,0,255"/>
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
            <frame shape="point" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="0,0,0,255"/>
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
            <frame shape="point" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="0,0,0,255"/>
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
            <frame shape="point" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="0,0,0,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
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
        <position x="8.0942915859375" y="334.5052191445312"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="DC Motor  " type="block">
      <diagram>
        <block name="Resistor_1" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/Resistor"/>
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
            <position x="197.644791" y="332.212921"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,0" clip="0" x="0.495" y="0.817" rotate="1" visible="1" font="Arial,12" align="center">R=1</text>
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
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="variableport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="mo_useHeatPort"/>
              </properties>
              <graphics>
                <location position="right" x="0.5" y="1"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="191,0,0,255" thickness="1.5"/>
                <background color="191,0,0,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_R" value="1"/>
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
        <block name="Inductor_1" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/Inductor"/>
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
            <position x="280.002609" y="332.212921"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,0" clip="0" x="0.515" y="0.9245" rotate="1" visible="1" font="Arial,12" align="center">L=0.0001</text>
            </texts>
            <images>
              <image name="image1" file="Electrical/Analog/Basic/Inductor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Electrical/Analog/Basic/Inductor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_L" value="0.0001"/>
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
        <block name="EMF" type="block">
          <template name="Modelica 3.2.1/Electrical/Analog/Basic/EMF"/>
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
            <position x="310.002609" y="396.884369"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
              <text name="text2" color="160,160,164,0" clip="0" x="0.9725" y="0.2245" rotate="1" visible="1" font="Arial,12" align="center">k=1</text>
            </texts>
            <images>
              <image name="image1" file="Electrical/Analog/Basic/EMF_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Electrical/Analog/Basic/EMF_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="top" x="0.5" y="0"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="0,0,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="bottom" x="0.5" y="1"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="2"/>
              </properties>
              <graphics>
                <location position="right" x="1.001" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
            <port name="" type="variableport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="mo_useSupport"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="7.5" height="7.5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="192,192,192,255" thickness="1.5"/>
                <background color="192,192,192,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_useSupport" value="0"/>
              <parameter name="mo_k" value="1"/>
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
              <parametertable name="mo_phi">
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
              <parametertable name="mo_w">
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
        <block name="Inertia_1" type="block">
          <template name="Modelica 3.2.1/Mechanics/Rotational/Components/Inertia"/>
          <properties>
            <property name="masked" value="1"/>
            <property name="inlinable" value="0"/>
            <property name="atomic" value="0"/>
            <property name="status" value="1"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="rectangle" visible="0" color="64,64,64,0" thickness="1.5"/>
            <background color="255,255,255,0"/>
            <position x="377.318222" y="396.884369"/>
            <size width="50" height="50"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
              <text name="text2" color="0,0,0,0" clip="0" x="0.5" y="1.0465" rotate="1" visible="1" font="Arial,12" align="center">J=1</text>
            </texts>
            <images>
              <image name="image1" file="Mechanics/Rotational/Components/Inertia_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
            </images>
            <flip value="0">
              <images>
                <image name="image2" file="Mechanics/Rotational/Components/Inertia_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
              </images>
            </flip>
          </graphics>
          <ports>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="in"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left" x="0" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="95,95,95,255"/>
              </graphics>
            </port>
            <port name="" type="fixedport">
              <properties>
                <property name="iotype" value="out"/>
                <property name="datatype" value="implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right" x="1.001" y="0.5"/>
                <size width="5" height="5"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
                <background color="255,255,255,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="General">
              <parameter name="mo_J" value="1"/>
              <parametertable name="mo_phi">
                <columns number="2">
                  <parameter name="fixed" value="0"/>
                  <parameter name="start" value="0"/>
                </columns>
                <rows number="1">
                  <row>
                    <value>0</value>
                    <value>0</value>
                  </row>
                </rows>
              </parametertable>
              <parametertable name="mo_w">
                <columns number="2">
                  <parameter name="fixed" value="0"/>
                  <parameter name="start" value="0"/>
                </columns>
                <rows number="1">
                  <row>
                    <value>0</value>
                    <value>0</value>
                  </row>
                </rows>
              </parametertable>
              <parametertable name="mo_a">
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
            <section name="Advanced">
              <parametercombobox name="mo_stateSelect">
                <parameter name="choice1" value="1"/>
                <parameter name="choice2" value="0"/>
                <parameter name="choice3" value="0"/>
                <parameter name="choice4" value="0"/>
                <parameter name="choice5" value="0"/>
              </parametercombobox>
            </section>
          </parameters>
        </block>
        <block name="ImplicitInput" type="implicit_in_port">
          <template name="system/Ports/ImplicitInput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="151.658035" y="347.212921"/>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
            </section>
          </parameters>
        </block>
        <block name="ImplicitInput_1" type="implicit_in_port">
          <template name="system/Ports/ImplicitInput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="150.576004" y="464.606903"/>
            <size width="20" height="20"/>
            <rotate angle="0"/>
            <texts>
              <text name="text1" color="0,0,0,255" clip="1" x="0.35" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">2</text>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="right"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="2"/>
            </section>
          </parameters>
        </block>
        <block name="ImplicitOutput" type="implicit_out_port">
          <template name="system/Ports/ImplicitOutput"/>
          <properties>
            <property name="inlinable" value="0"/>
            <property name="masked" value="1"/>
            <property name="atomic" value="0"/>
          </properties>
          <graphics>
            <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
            <frame shape="pentagon" visible="1" color="0,15,142,255" cornerradius="0" thickness="1.5"/>
            <background color="255,255,255,255"/>
            <position x="482.185715" y="411.884369"/>
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
                <property name="datatype" value="Implicit"/>
                <property name="portnumber" value="1"/>
              </properties>
              <graphics>
                <location position="left"/>
                <label visible="1" font="Arial,10" color="255,255,255,255"/>
                <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
                <background color="0,15,142,255"/>
              </graphics>
            </port>
          </ports>
          <parameters>
            <section name="Parameters">
              <parameter name="portNumber" value="1"/>
            </section>
          </parameters>
        </block>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Resistor_1" port="1" iotype="out"/>
          <to block="Inductor_1" port="1" iotype="in"/>
          <pen shape="line" color="0,0,255,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Inductor_1" port="1" iotype="out"/>
          <to block="EMF" port="1" iotype="in"/>
          <pen shape="line" color="0,0,255,255" thickness="1.5"/>
          <points>
            <point x="335.002609" y="357.212921"/>
          </points>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="EMF" port="2" iotype="out"/>
          <to block="Inertia_1" port="1" iotype="in"/>
          <pen shape="line" color="0,0,0,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="ImplicitInput" port="1" iotype="out"/>
          <to block="Resistor_1" port="1" iotype="in"/>
          <pen shape="line" color="0,15,142,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="Inertia_1" port="1" iotype="out"/>
          <to block="ImplicitOutput" port="1" iotype="in"/>
          <pen shape="line" color="0,0,0,255" thickness="1.5"/>
          <points/>
        </link>
        <link name="" type="Implicit">
          <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
          <from block="ImplicitInput_1" port="1" iotype="out"/>
          <to block="EMF" port="1" iotype="out"/>
          <pen shape="line" color="0,15,142,255" thickness="1.5"/>
          <points>
            <point x="335.002609" y="474.606903"/>
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
        <frame shape="rectangle" visible="0" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="194.3814085859375" y="412.49332907617185"/>
        <size width="48" height="36"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="dcmotoricon.PNG" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="dcmotoricon.PNG" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
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
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,15,142,255" thickness="1.5"/>
            <background color="0,15,142,255"/>
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
        <background color="218,229,241,255"/>
        <position x="353.4250255859375" y="276.40869207617186"/>
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
        <port name="&quot;&quot; &quot;&quot;" type="variableport">
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
          <parameter name="nin" value="2"/>
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
            </rows>
          </parametertable>
        </section>
      </parameters>
    </block>
    <block name="Scope_V" type="block">
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
        <background color="218,229,241,255"/>
        <position x="-27.714026414062502" y="409.49332907617185"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalViewers/scope.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="1">
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
    <block name="StepVoltage_1" type="block">
      <template name="Modelica 3.2.1/Electrical/Analog/Sources/StepVoltage"/>
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
        <position x="-49.0736139154335" y="271.40869207617186"/>
        <size width="50" height="50"/>
        <rotate angle="90"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
          <text name="text2" color="0,0,255,0" clip="0" x="0.15" y="0.433" rotate="1" visible="1" font="Arial,12" align="center">+</text>
          <text name="text3" color="0,0,255,0" clip="0" x="0.85" y="0.433" rotate="1" visible="1" font="Arial,12" align="center">-</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Sources/StepVoltage_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Electrical/Analog/Sources/StepVoltage_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parameter name="mo_V" value="1"/>
          <parameter name="mo_offset" value="0"/>
          <parameter name="mo_startTime" value="0"/>
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
    <block name="Ground_2" type="block">
      <template name="Modelica 3.2.1/Electrical/Analog/Basic/Ground"/>
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
        <position x="-16.9057084140625" y="348.35101307617185"/>
        <size width="50" height="50"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
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
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top" x="0.5" y="0"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
      </parameters>
    </block>
    <block name="Ground_2_1" type="block">
      <template name="Modelica 3.2.1/Electrical/Analog/Basic/Ground"/>
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
        <position x="87.62359658593751" y="485.93841607617185"/>
        <size width="49.999999999999986" height="50"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
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
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="top" x="0.5" y="0"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
      </parameters>
    </block>
    <block name="AngleSensor_1" type="block">
      <template name="Modelica 3.2.1/Mechanics/Rotational/Sensors/AngleSensor"/>
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
        <position x="189.2507705859375" y="243.10318007617187"/>
        <size width="50" height="49.99999999999997"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
          <text name="text2" color="0,0,0,0" clip="0" x="0.975" y="0.7915" rotate="1" visible="1" font="Arial,12" align="center">phi</text>
        </texts>
        <images>
          <image name="image1" file="Mechanics/Rotational/Sensors/AngleSensor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Mechanics/Rotational/Sensors/AngleSensor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="95,95,95,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,0,127,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parametertable name="mo_phi">
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
    <block name="SpeedSensor_1" type="block">
      <template name="Modelica 3.2.1/Mechanics/Rotational/Sensors/SpeedSensor"/>
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
        <position x="189.2507705859375" y="315.10418707617185"/>
        <size width="50" height="50"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
          <text name="text2" color="0,0,0,0" clip="0" x="0.975" y="0.7965" rotate="1" visible="1" font="Arial,12" align="center">w</text>
        </texts>
        <images>
          <image name="image1" file="Mechanics/Rotational/Sensors/SpeedSensor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Mechanics/Rotational/Sensors/SpeedSensor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="95,95,95,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,0,127,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parametertable name="mo_w">
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
        <position x="311.4163205859375" y="281.40869207617186"/>
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
    <block name="FromModelica_1" type="block">
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
        <position x="311.4163205859375" y="301.40869207617186"/>
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
    <block name="SquareWaveGenerator" type="block">
      <template name="system/SignalGenerators/SquareWaveGenerator"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="1"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="430.6843875859375" y="408.24332907617185"/>
        <size width="40" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
        </texts>
        <images>
          <image name="image1" file="SignalGenerators/squareWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="1">
          <images>
            <image name="image2" file="SignalGenerators/squareWaveGenerator.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
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
          <parameter name="FV" value="1"/>
          <parameter name="SV" value="0"/>
          <parameter name="period" value="1"/>
          <parameter name="dutyCycle" value="50"/>
          <parameter name="offset" value="0"/>
          <parameter name="datatype" value="&apos;inherit&apos;"/>
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
        <position x="373.3311155859375" y="423.24332907617185"/>
        <size width="10" height="10"/>
        <rotate angle="180"/>
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
          <parameter name="value" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Torque_1" type="block">
      <template name="Modelica 3.2.1/Mechanics/Rotational/Sources/Torque"/>
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
        <position x="279.3809205859375" y="404.49332907617185"/>
        <size width="50" height="55"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center"/>
          <text name="text2" color="0,0,0,0" clip="0" x="-0.0075" y="0.72273" rotate="1" visible="1" font="Arial,12" align="center">tau</text>
        </texts>
        <images>
          <image name="image1" file="Mechanics/Rotational/Sources/Torque_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="1">
          <images>
            <image name="image2" file="Mechanics/Rotational/Sources/Torque_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1.001" y="0.45454545454545453"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="ellipse" visible="1" color="0,0,0,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.45454545454545453"/>
            <size width="10" height="10"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="0,0,127,255" thickness="1.5"/>
            <background color="0,0,127,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="mo_useSupport"/>
          </properties>
          <graphics>
            <location position="right" x="0.5" y="0.9090909090909091"/>
            <size width="7.5" height="7.500000000000001"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="192,192,192,255" thickness="1.5"/>
            <background color="192,192,192,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="General">
          <parameter name="mo_useSupport" value="0"/>
          <parametertable name="mo_tau">
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
    <block name="VoltageSensor_1" type="block">
      <template name="Modelica 3.2.1/Electrical/Analog/Sensors/VoltageSensor"/>
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
        <position x="87.62359658593751" y="404.49332907617185"/>
        <size width="49.999999999999986" height="50"/>
        <rotate angle="90"/>
        <texts>
          <text name="text1" color="0,0,0,0" clip="0" x="0.5025" y="0.771" rotate="1" visible="1" font="Arial,12" align="center">V</text>
        </texts>
        <images>
          <image name="image1" file="Electrical/Analog/Sensors/VoltageSensor_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="Electrical/Analog/Sensors/VoltageSensor_mirrored_no_ports.svg" visible="1" alpha="255" aspectratio="0" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left" x="0" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="right" x="1" y="0.5"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="rectangle" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="implicit"/>
            <property name="portnumber" value="2"/>
          </properties>
          <graphics>
            <location position="bottom" x="0.5" y="0.95"/>
            <size width="5" height="5"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
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
        <position x="112.6235965859375" y="471.30654907617185"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
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
            <frame shape="point" visible="1" color="0,0,255,255" thickness="1.5"/>
            <background color="0,0,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Parameters">
        </section>
      </parameters>
    </block>
    <block name="FromModelica_2" type="block">
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
        <position x="50.7047845859375" y="424.49332907617185"/>
        <size width="10" height="10"/>
        <rotate angle="180"/>
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
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="DC Motor" port="1" iotype="out"/>
      <to block="Block" port="1" iotype="in"/>
      <pen shape="line" color="0,15,142,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="2" iotype="out"/>
      <to block="SpeedSensor_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,0,255" thickness="1.5"/>
      <points>
        <point x="174.7094115859375" y="340.10418707617185"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block" port="1" iotype="out"/>
      <to block="AngleSensor_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,0,255" thickness="1.5"/>
      <points>
        <point x="174.7094115859375" y="268.10318007617184"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ImplicitSplit" port="1" iotype="in"/>
      <to block="Ground_2" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="DC Motor" port="1" iotype="in"/>
      <to block="StepVoltage_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="45.71223449706919" y="287.408692076172"/>
        <point x="45.71223449707073" y="256.678955078125"/>
        <point x="-24.073613903356026" y="256.67895507812506"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ImplicitSplit" port="2" iotype="out"/>
      <to block="StepVoltage_1" port="1" iotype="out"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="-24.073613908159672" y="334.50521914453145"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ImplicitSplit" port="1" iotype="out"/>
      <to block="DC Motor" port="2" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points>
        <point x="46.12951658593754" y="334.50521914453117"/>
        <point x="46.1295165859375" y="305.4086920761718"/>
      </points>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor_1" port="1" iotype="out"/>
      <to block="Block_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SquareWaveGenerator" port="1" iotype="out"/>
      <to block="ToModelica" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="AngleSensor_1" port="1" iotype="out"/>
      <to block="FromModelica" port="1" iotype="in"/>
      <pen shape="line" color="0,0,127,255" thickness="1.5"/>
      <points>
        <point x="280.7737955859375" y="268.1031800761719"/>
        <point x="280.7737955859375" y="286.40869207617186"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="FromModelica" port="1" iotype="out"/>
      <to block="Scope" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="SpeedSensor_1" port="1" iotype="out"/>
      <to block="FromModelica_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,127,255" thickness="1.5"/>
      <points>
        <point x="280.7737955859375" y="340.10418707617185"/>
        <point x="280.7737955859375" y="306.40869207617186"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="FromModelica_1" port="1" iotype="out"/>
      <to block="Scope" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ToModelica" port="1" iotype="out"/>
      <to block="Torque_1" port="1" iotype="in"/>
      <pen shape="line" color="0,15,142,255" thickness="1.5"/>
      <points>
        <point x="339.3809205859375" y="428.24332907617185"/>
      </points>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor_1" port="1" iotype="in"/>
      <to block="DC Motor  " port="1" iotype="in"/>
      <pen shape="line" color="0,15,142,255" thickness="1.5"/>
      <points>
        <point x="112.62359649903657" y="388.63565063476574"/>
        <point x="153.50249758593836" y="388.6356506347657"/>
        <point x="153.50249758593753" y="421.49332907617185"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="2" iotype="out"/>
      <to block="DC Motor  " port="2" iotype="in"/>
      <pen shape="line" color="0,15,142,255" thickness="1.5"/>
      <points>
        <point x="180.0061365859375" y="471.30654907617185"/>
        <point x="180.0061365859375" y="439.49332907617185"/>
      </points>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Block_1" port="1" iotype="out"/>
      <to block="Ground_2_1" port="1" iotype="in"/>
      <pen shape="line" color="0,0,255,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="DC Motor  " port="1" iotype="out"/>
      <to block="Torque_1" port="1" iotype="out"/>
      <pen shape="line" color="0,15,142,255" thickness="1.5"/>
      <points>
        <point x="242.38141858593747" y="429.49332907617173"/>
      </points>
    </link>
    <link name="" type="implicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="VoltageSensor_1" port="2" iotype="out"/>
      <to block="FromModelica_2" port="1" iotype="in"/>
      <pen shape="line" color="0,0,127,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="FromModelica_2" port="1" iotype="out"/>
      <to block="Scope_V" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <annotation name="Annotation_1" type="text">
      <frame shape="rectangle" visible="0" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
      <background color="0,0,0,0"/>
      <position x="210.16050749023438" y="478.1912844863281"/>
      <size width="84.00000000000003" height="28"/>
      <rotate angle="0"/>
      <text font="Arial,10" color="0,0,0,255">motor.scm</text>
    </annotation>
    <context>A=[-0.3,3,1;0,0,2;0,0,0];&#xA;B=[1;2;3];&#xA;C=[1,1,2;0,2,3];&#xA;D=0;&#xA;x0=[-2;1;2];&#xA;K=[0.1834511,-0.0635571;0.0556004,0.5931633;0.0409687,0.0975615];&#xA;L=[-0.0041585,-0.1489701,-0.4993004];&#xA;</context>
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
      <property name="MaxTimeInterval" value="31"/>
      <property name="TimeTolerance" value="1e-10"/>
      <property name="Solver" value="cvode1"/>
      <property name="MaxStepSize" value="0"/>
      <property name="InitialStepSize" value="0"/>
      <property name="MinimalStepSize" value="0"/>
      <property name="ZeroCrossingThreshold" value="0"/>
      <property name="NumberOfConsecutiveZeroCrossing" value="0"/>
      <property name="TimeToleranceZeroCrossing" value="0"/>
      <property name="AlgebraicSolver" value="idacalc"/>
      <property name="JacobianMethod" value="1"/>
    </properties>
  </simulation>
</model>
