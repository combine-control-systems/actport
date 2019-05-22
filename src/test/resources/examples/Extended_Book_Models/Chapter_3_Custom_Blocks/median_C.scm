<?xml version="1.0" encoding="UTF-8"?>
<model name="median_C">
  <header formatversion="2" hwxversion="2018.1" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value="Altair Engineering Inc."/>
      <property name="creationdate" value="03/29/12 14:53:14"/>
      <property name="revision" value=""/>
      <property name="lastmodifieddate" value="03/19/18 01:42:46"/>
      <property name="comments" value=""/>
    </properties>
  </edition>
  <initialization/>
  <diagram>
    <block name="CCustomBlock" type="block">
      <template name="system/CustomBlocks/CCustomBlock"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="236,223,233,254"/>
        <position x="138.5" y="-3.565872"/>
        <size width="72" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">C&#xA;Block</text>
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
        <port name="&quot;med&quot;" type="variableport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Explicit"/>
            <property name="portnumber" value="nout"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="&quot;mat&quot;" type="variableport">
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
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="nevin"/>
          </properties>
          <graphics>
            <location position="top"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
        <port name="" type="variableport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="nevout"/>
          </properties>
          <graphics>
            <location position="bottom"/>
            <label visible="1" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="183,15,19,255" thickness="1.5"/>
            <background color="183,15,19,255"/>
          </graphics>
        </port>
      </ports>
      <parameters>
        <section name="Ports">
          <parameter name="nin" value="1"/>
          <parametertable name="inports">
            <columns number="5">
              <parameter name="inrow" value="1"/>
              <parameter name="incol" value="1"/>
              <parameter name="it" value="&apos;double&apos;"/>
              <parameter name="depu" value="1"/>
              <parameter name="name" value="&apos;&apos;"/>
            </columns>
            <rows number="nin">
              <row>
                <value>-1</value>
                <value>-2</value>
                <value>&apos;double&apos;</value>
                <value>1</value>
                <value>&apos;mat&apos;</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="nevin" value="0"/>
          <parameter name="nout" value="1"/>
          <parametertable name="outports">
            <columns number="4">
              <parameter name="outrow" value="1"/>
              <parameter name="outcol" value="1"/>
              <parameter name="ot" value="&apos;double&apos;"/>
              <parameter name="name" value="&apos;&apos;"/>
            </columns>
            <rows number="nout">
              <row>
                <value>1</value>
                <value>1</value>
                <value>&apos;double&apos;</value>
                <value>&apos;med&apos;</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="nevout" value="0"/>
          <parametertable name="evoutports">
            <columns number="1">
              <parameter name="fir" value="-1"/>
            </columns>
            <rows number="nevout">
            </rows>
          </parametertable>
        </section>
        <section name="States">
          <parameter name="xx" value="[]"/>
          <parameter name="xd" value="[]"/>
          <parameter name="z" value="[]"/>
          <parameter name="noz" value="0"/>
          <parametertable name="ozparams">
            <columns number="3">
              <parameter name="oztyp" value="&apos;double&apos;"/>
              <parameter name="ozvalue" value="1"/>
              <parameter name="name" value="&apos;&apos;"/>
            </columns>
            <rows number="noz">
            </rows>
          </parametertable>
        </section>
        <section name="Parameters">
          <parameter name="rpar" value="[]"/>
          <parameter name="ipar" value="[]"/>
          <parameter name="nopar" value="0"/>
          <parametertable name="oparparams">
            <columns number="3">
              <parameter name="opartyp" value="&apos;double&apos;"/>
              <parameter name="oparvalue" value="1"/>
              <parameter name="name" value="&apos;&apos;"/>
            </columns>
            <rows number="nopar">
            </rows>
          </parametertable>
        </section>
        <section name="SimFunction">
          <parameter name="inlined" value="1"/>
          <parameter name="code" value="[&apos;typedef double elem_type ;&apos;,char(10),char(10),&apos;elem_type torben(elem_type m[], int n)&apos;,char(10),&apos;{&apos;,char(10),&apos;    int         i, less, greater, equal;&apos;,char(10),&apos;    elem_type  min, max, guess, maxltguess, mingtguess;&apos;,char(10),char(10),&apos;    min = max = m[0] ;&apos;,char(10),&apos;    for (i=1 ; i&lt;n ; i++) {&apos;,char(10),&apos;        if (m[i]&lt;min) min=m[i];&apos;,char(10),&apos;        if (m[i]&gt;max) max=m[i];&apos;,char(10),&apos;    }&apos;,char(10),char(10),&apos;    while (1) {&apos;,char(10),&apos;        guess = (min+max)/2;&apos;,char(10),&apos;        less = 0; greater = 0; equal = 0;&apos;,char(10),&apos;        maxltguess = min ;&apos;,char(10),&apos;        mingtguess = max ;&apos;,char(10),&apos;        for (i=0; i&lt;n; i++) {&apos;,char(10),&apos;            if (m[i]&lt;guess) {&apos;,char(10),&apos;                less++;&apos;,char(10),&apos;                if (m[i]&gt;maxltguess) maxltguess = m[i] ;&apos;,char(10),&apos;            } else if (m[i]&gt;guess) {&apos;,char(10),&apos;                greater++;&apos;,char(10),&apos;                if (m[i]&lt;mingtguess) mingtguess = m[i] ;&apos;,char(10),&apos;            } else equal++;&apos;,char(10),&apos;        }&apos;,char(10),&apos;        if (less &lt;= (n+1)/2 &amp;&amp; greater &lt;= (n+1)/2) break ; &apos;,char(10),&apos;        else if (less&gt;greater) max = maxltguess ;&apos;,char(10),&apos;        else min = mingtguess;&apos;,char(10),&apos;    }&apos;,char(10),&apos;    if (less &gt;= (n+1)/2) return maxltguess;&apos;,char(10),&apos;    else if (less+equal &gt;= (n+1)/2) return guess;&apos;,char(10),&apos;    else return mingtguess;&apos;,char(10),&apos;}&apos;,char(10),char(10),&apos;#include &quot;vss_block4.h&quot;&apos;,char(10),&apos;VSS_EXPORT void CBlockFunction(vss_block *block,int flag)&apos;,char(10),&apos;{&apos;,char(10),&apos;  SCSREAL_COP *mat=(SCSREAL_COP *)GetInPortPtrs(block,1);&apos;,char(10),&apos;  int mmat=GetInPortRows(block,1);&apos;,char(10),&apos;  int nmat=GetInPortCols(block,1);&apos;,char(10),&apos;  SCSREAL_COP *med=(SCSREAL_COP *)GetOutPortPtrs(block,1);&apos;,char(10),&apos;  switch (flag){&apos;,char(10),&apos;  case VssFlag_OutputUpdate:&apos;,char(10),&apos;    med[0]=torben(mat, mmat*nmat);&apos;,char(10),&apos;    break;&apos;,char(10),&apos;  }&apos;,char(10),&apos;}&apos;,char(10),char(10)]"/>
          <parametertable name="fcn">
            <columns number="2">
              <parameter name="slib" value="1"/>
              <parameter name="epoint" value="&apos;&apos;"/>
            </columns>
            <rows number="1">
              <row>
                <value>&apos;&apos;</value>
                <value>&apos;&apos;</value>
              </row>
            </rows>
          </parametertable>
          <parameter name="impl" value="0"/>
          <parameter name="nincludepath" value="0"/>
          <parametertable name="includepath">
            <columns number="1">
              <parameter name="path" value="&apos;&apos;"/>
            </columns>
            <rows number="nincludepath">
            </rows>
          </parametertable>
          <parameter name="ndefine" value="0"/>
          <parametertable name="define">
            <columns number="1">
              <parameter name="path" value="&apos;&apos;"/>
            </columns>
            <rows number="ndefine">
            </rows>
          </parametertable>
          <parameter name="ncompileflags" value="0"/>
          <parametertable name="compileflags">
            <columns number="1">
              <parameter name="path" value="&apos;&apos;"/>
            </columns>
            <rows number="ncompileflags">
            </rows>
          </parametertable>
          <parameter name="nlibpath" value="0"/>
          <parametertable name="libpath">
            <columns number="1">
              <parameter name="path" value="&apos;&apos;"/>
            </columns>
            <rows number="nlibpath">
            </rows>
          </parametertable>
          <parameter name="nlibs" value="0"/>
          <parametertable name="libs">
            <columns number="1">
              <parameter name="path" value="&apos;&apos;"/>
            </columns>
            <rows number="nlibs">
            </rows>
          </parametertable>
        </section>
        <section name="Advanced">
          <parameter name="nmode" value="0"/>
          <parameter name="nzcr" value="0"/>
          <parameter name="dept" value="&apos;Standard mode&apos;"/>
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
        <background color="218,229,241,254"/>
        <position x="-9.5" y="2.434128"/>
        <size width="60" height="36"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">rand(4,5)</text>
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
          <parameter name="C" value="rand(4,5)"/>
          <parameter name="typ" value="&apos;double&apos;"/>
          <parameter name="externalActivation" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Display" type="block">
      <template name="system/SignalViewers/Display"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="233,240,219,254"/>
        <position x="304.310669" y="-3.565872"/>
        <size width="96" height="48"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">0</text>
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
          <parameter name="fmt" value="&apos;%6f&apos;"/>
          <parameter name="dt" value="1"/>
          <parameter name="externalActivation" value="0"/>
          <parameter name="showatend" value="0"/>
        </section>
      </parameters>
    </block>
    <block name="Display_1" type="block">
      <template name="system/SignalViewers/Display"/>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="0"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="233,240,219,254"/>
        <position x="112.310669" y="67.771469"/>
        <size width="288" height="96"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">0</text>
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
          <parameter name="fmt" value="&apos;%6f&apos;"/>
          <parameter name="dt" value="1"/>
          <parameter name="externalActivation" value="0"/>
          <parameter name="showatend" value="0"/>
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
        <position x="84" y="20.434128"/>
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
            <location position="top"/>
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
            <location position="bottom"/>
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
      <from block="Constant" port="1" iotype="out"/>
      <to block="Split" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="CCustomBlock" port="1" iotype="out"/>
      <to block="Display" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="2" iotype="out"/>
      <to block="Display_1" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points>
        <point x="84" y="115.771469"/>
      </points>
    </link>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="Split" port="1" iotype="out"/>
      <to block="CCustomBlock" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <annotation name="Annotation" type="text">
      <frame shape="rectangle" visible="0" color="0,0,0,255" cornerradius="0" thickness="1.5"/>
      <background color="0,0,0,0"/>
      <position x="159.070892" y="153.038132"/>
      <size width="109.99999999999997" height="28"/>
      <rotate angle="0"/>
      <text font="Arial,10" color="0,0,0,255">median_C.scm</text>
    </annotation>
    <context>g=1.4;&#xA;</context>
    <graphics>
      <viewport width="800" height="800" topleftx="0" toplefty="0"/>
      <window width="800" height="800" topleftx="0" toplefty="0"/>
    </graphics>
  </diagram>
  <simulation>
    <properties>
      <property name="InitialTime" value="0"/>
      <property name="FinalTime" value="3"/>
      <property name="RealTimeScale" value="0"/>
      <property name="AbsoluteErrorTolerance" value="0.000001"/>
      <property name="RelativeErrorTolerance" value="0.000001"/>
      <property name="MaxTimeInterval" value="-1"/>
      <property name="TimeTolerance" value="-1"/>
      <property name="Solver" value="lsodar"/>
      <property name="MaxStepSize" value="0"/>
      <property name="InitialStepSize" value="0"/>
      <property name="MinimalStepSize" value="0"/>
      <property name="ZeroCrossingThreshold" value="-1"/>
      <property name="NumberOfConsecutiveZeroCrossing" value="-1"/>
      <property name="TimeToleranceZeroCrossing" value="-1"/>
      <property name="AlgebraicSolver" value="idacalc"/>
      <property name="JacobianMethod" value="1"/>
    </properties>
  </simulation>
</model>
