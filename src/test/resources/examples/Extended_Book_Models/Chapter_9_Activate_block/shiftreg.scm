<?xml version="1.0" encoding="UTF-8"?>
<model name="shiftreg">
  <header formatversion="2" hwxversion="2019.0" script="oml"/>
  <edition>
    <properties>
      <property name="creator" value="ramin"/>
      <property name="creationdate" value="07/28/18 11:34:17"/>
      <property name="revision" value="0"/>
      <property name="lastmodifieddate" value="08/04/18 14:48:36"/>
      <property name="comments" value=""/>
    </properties>
  </edition>
  <initialization/>
  <diagram>
    <block name="ModuloCounter" type="block">
      <template name="system/SignalGenerators/ModuloCounter"/>
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
        <position x="-321.93035888671875" y="79.93887329101563"/>
        <size width="84" height="60"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">Counter&#xA;Modulo 10</text>
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
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="1"/>
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
          <parameter name="ini_state" value="0"/>
          <parameter name="base" value="10"/>
          <parameter name="step" value="1"/>
          <parameter name="typ" value="&apos;double&apos;"/>
        </section>
      </parameters>
    </block>
    <block name="SampleClock" type="block">
      <template name="system/ActivationOperations/SampleClock"/>
      <properties>
        <property name="inlinable" value="0"/>
        <property name="masked" value="1"/>
        <property name="atomic" value="0"/>
      </properties>
      <graphics>
        <label position="top" visible="0" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="0" color="0,0,0,0" thickness="1.5"/>
        <background color="255,255,255,0"/>
        <position x="-309.93035888671875" y="-0.88165283203125"/>
        <size width="60" height="40"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.5" y="0.5" rotate="1" visible="1" font="Arial,12" align="center">2&#xA;0</text>
        </texts>
        <images>
          <image name="image1" file="ActivationOperations/sampleClock.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
        </images>
        <flip value="0">
          <images>
            <image name="image2" file="ActivationOperations/sampleClock.svg" visible="1" alpha="255" aspectratio="1" x="0" y="0" width="1" height="1" clip="1" rotate="1"/>
          </images>
        </flip>
      </graphics>
      <ports>
        <port name="" type="fixedport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="Activation"/>
            <property name="portnumber" value="1"/>
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
        <section name="Parameters">
          <parameter name="frequ" value="2"/>
          <parameter name="offset" value="0"/>
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
        <position x="1.7613525390625" y="79.93887329101563"/>
        <size width="60" height="60"/>
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
    <block name="shiftreg" type="block">
      <code>
        <functions/>
        <script>
          <setparams>function shiftreg_setdiagram_1 (_diagram, _label, __fenv__)&#xA;_curdiagram=_diagram;&#xA;_curlabel=_label;&#xA;importenv(__fenv__);&#xA;_diagram=_curdiagram;&#xA;_label=_curlabel;&#xA;clear _curdiagram;&#xA;clear _curlabel;&#xA;global _vss;&#xA;global __OBJ_ERR_;&#xA;_parent = __OBJ_ERR_.(&apos;block&apos;);&#xA;__OBJ_ERR_.(&apos;type&apos;)=&apos;context&apos;;&#xA;if isscalar(z0) z0=z0*ones(nout,1); elseif length(z0)~=nout error(&apos;size of z0 must match nb of outputs.&apos;);end&#xA;__OBJ_ERR_.(&apos;block&apos;)=vssConstructBlockFullName(_parent,&apos;DiscreteDelay&apos;);&#xA;_params=struct();&#xA;_params.init_cond=z0(1);&#xA;_params.typ=&apos;double&apos;;&#xA;_params.externalActivation=0;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Dynamical&apos;,&apos;DiscreteDelay&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Dynamical&apos;).(&apos;DiscreteDelay&apos;).setparams(_diagram,&apos;DiscreteDelay&apos;,_params);&#xA;_params=struct();&#xA;vssLoadBlock(&apos;system&apos;,&apos;Links&apos;,&apos;Split&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Links&apos;).(&apos;Split&apos;).setparams(_diagram,&apos;Split_1&apos;,_params);&#xA;_params=struct();&#xA;_params.portNumber=1;&#xA;_params.outsize=[-1;-2];&#xA;_params.outtyp=&apos;inherit&apos;;&#xA;_params.dept=0;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Ports&apos;,&apos;Input&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Ports&apos;).(&apos;Input&apos;).setparams(_diagram,&apos;Input&apos;,_params);&#xA;_params=struct();&#xA;_params.portNumber=1;&#xA;_params.insize=[-1;-2];&#xA;_params.intyp=&apos;inherit&apos;;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Ports&apos;,&apos;Output&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Ports&apos;).(&apos;Output&apos;).setparams(_diagram,&apos;Output&apos;,_params);&#xA;vssAdd_Link(_diagram,&apos;Input&apos;,&apos;DiscreteDelay&apos;,1,1,0,1,1);&#xA;vssAdd_Link(_diagram,&apos;DiscreteDelay&apos;,&apos;Split_1&apos;,1,1,0,1,1);&#xA;vssAdd_Link(_diagram,&apos;Split_1&apos;,&apos;Output&apos;,2,1,0,1,1);&#xA;for i=2:nout-1&#xA;  _params=struct();&#xA;  _params.init_cond=z0(i);&#xA;  _params.typ=&apos;double&apos;;&#xA;  _params.externalActivation=0;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Dynamical&apos;,&apos;DiscreteDelay&apos;);&#xA;  _vss._palettes.(&apos;_system&apos;).(&apos;Dynamical&apos;).(&apos;DiscreteDelay&apos;).setparams(_diagram,[&apos;DiscreteDelay_&apos;,num2str(i-1)],_params);&#xA;  _params=struct();&#xA;  _params.portNumber=i;&#xA;  _params.insize=[-1;-2];&#xA;  _params.intyp=&apos;inherit&apos;;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Ports&apos;,&apos;Output&apos;);&#xA;  _vss._palettes.(&apos;_system&apos;).(&apos;Ports&apos;).(&apos;Output&apos;).setparams(_diagram,[&apos;Output_&apos;,num2str(i-1)],_params);&#xA;  _params=struct();&#xA;vssLoadBlock(&apos;system&apos;,&apos;Links&apos;,&apos;Split&apos;);&#xA;  _vss._palettes.(&apos;_system&apos;).(&apos;Links&apos;).(&apos;Split&apos;).setparams(_diagram,[&apos;Split_&apos;,num2str(i)],_params);&#xA;  vssAdd_Link(_diagram,[&apos;Split_&apos;,num2str(i-1)],[&apos;DiscreteDelay_&apos;,num2str(i-1)],1,1,0,1,1);&#xA;  vssAdd_Link(_diagram,[&apos;DiscreteDelay_&apos;,num2str(i-1)],[&apos;Split_&apos;,num2str(i)],1,1,0,1,1);&#xA;  vssAdd_Link(_diagram,[&apos;Split_&apos;,num2str(i)],[&apos;Output_&apos;,num2str(i-1)],2,1,0,1,1);&#xA;end&#xA;_params=struct();&#xA;_params.init_cond=z0(nout);&#xA;_params.typ=&apos;double&apos;;&#xA;_params.externalActivation=0;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Dynamical&apos;,&apos;DiscreteDelay&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Dynamical&apos;).(&apos;DiscreteDelay&apos;).setparams(_diagram,[&apos;DiscreteDelay_&apos;,num2str(nout-1)],_params);&#xA;_params=struct();&#xA;_params.portNumber=nout;&#xA;_params.insize=[-1;-2];&#xA;_params.intyp=&apos;inherit&apos;;&#xA;vssLoadBlock(&apos;system&apos;,&apos;Ports&apos;,&apos;Output&apos;);&#xA;_vss._palettes.(&apos;_system&apos;).(&apos;Ports&apos;).(&apos;Output&apos;).setparams(_diagram,[&apos;Output_&apos;,num2str(nout-1)],_params);&#xA;vssAdd_Link(_diagram,[&apos;DiscreteDelay_&apos;,num2str(nout-1)],[&apos;Output_&apos;,num2str(nout-1)],1,1,0,1,1);&#xA;vssAdd_Link(_diagram,[&apos;Split_&apos;,num2str(nout-1)],[&apos;DiscreteDelay_&apos;,num2str(nout-1)],1,1,0,1,1);&#xA;end&#xA;&#xA;_block = vssAddNewObject(&apos;SubSystem&apos;,_diagram);&#xA;_diagr= vssCreateObject(&apos;Diagram&apos;);&#xA;shiftreg_setdiagram_1(_diagr,_label,getcurrentenv());&#xA;vssSet_SubSystem(_block,1,nout,0,0,0,_label,_diagr);&#xA;&#xA;</setparams>
          <setio/>
          <reset/>
        </script>
      </code>
      <properties>
        <property name="masked" value="1"/>
        <property name="inlinable" value="1"/>
        <property name="atomic" value="0"/>
        <property name="status" value="1"/>
      </properties>
      <graphics>
        <label position="bottom" visible="1" font="Arial,11" color="255,255,255,255"/>
        <frame shape="rectangle" visible="1" color="0,0,0,255" thickness="1.5"/>
        <background color="255,255,255,255"/>
        <position x="-178.09976196289062" y="79.93887329101563"/>
        <size width="108" height="60"/>
        <rotate angle="0"/>
        <texts>
          <text name="text1" color="0,0,0,255" clip="1" x="0.500000" y="0.500000" rotate="1" visible="1" font="Arial,10" align="center"/>
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
        <port name="Input" type="fixedport">
          <properties>
            <property name="iotype" value="in"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="1"/>
          </properties>
          <graphics>
            <location position="left"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="64,64,64,255"/>
          </graphics>
        </port>
        <port name="Output" type="variableport">
          <properties>
            <property name="iotype" value="out"/>
            <property name="datatype" value="explicit"/>
            <property name="portnumber" value="nout"/>
          </properties>
          <graphics>
            <location position="right"/>
            <label visible="0" font="Arial,10" color="255,255,255,255"/>
            <frame shape="triangle" visible="1" color="64,64,64,255" thickness="1.5"/>
            <background color="255,255,255,255"/>
          </graphics>
        </port>
      </ports>
      <parameters title="new block definition">
        <callback>
          <pre/>
          <post/>
        </callback>
        <section name="Parameters">
          <parameter name="nout" value="4" widget="lineedit" type="number" callback="" displayname="nout" tooltip="" unit="" dimensions="[]" visible="1" enabled="1"/>
          <parameter name="z0" value="0" widget="lineedit" type="generic" callback="" displayname="z0" tooltip="" unit="" dimensions="[]" visible="1" enabled="1"/>
        </section>
      </parameters>
    </block>
    <link name="" type="Explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ModuloCounter" port="1" iotype="out"/>
      <to block="shiftreg" port="1" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="Activation">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="ModuloCounter" port="1" iotype="in"/>
      <to block="SampleClock" port="1" iotype="out"/>
      <pen shape="line" color="183,15,19,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="shiftreg" port="4" iotype="out"/>
      <to block="Scope" port="4" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="shiftreg" port="3" iotype="out"/>
      <to block="Scope" port="3" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="shiftreg" port="2" iotype="out"/>
      <to block="Scope" port="2" iotype="in"/>
      <pen shape="line" color="64,64,64,255" thickness="1.5"/>
      <points/>
    </link>
    <link name="" type="explicit">
      <label position="bottom" visible="0" font="Arial,11" color="255,255,255,255"/>
      <from block="shiftreg" port="1" iotype="out"/>
      <to block="Scope" port="1" iotype="in"/>
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
