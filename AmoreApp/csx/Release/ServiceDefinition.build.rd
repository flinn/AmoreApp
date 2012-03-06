<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AmoreApp" generation="1" functional="0" release="0" Id="1be0fac6-e116-4f2b-b4e7-8e5a4a2af9b1" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AmoreAppGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="AmoreApp.AmoreAPI:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AmoreApp/AmoreAppGroup/LB:AmoreApp.AmoreAPI:Endpoint1" />
          </inToChannel>
        </inPort>
        <inPort name="AmoreApp.Website:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AmoreApp/AmoreAppGroup/LB:AmoreApp.Website:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="AmoreApp.AmoreAPI:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AmoreApp/AmoreAppGroup/MapAmoreApp.AmoreAPI:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AmoreApp.AmoreAPIInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AmoreApp/AmoreAppGroup/MapAmoreApp.AmoreAPIInstances" />
          </maps>
        </aCS>
        <aCS name="AmoreApp.Website:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AmoreApp/AmoreAppGroup/MapAmoreApp.Website:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="AmoreApp.WebsiteInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AmoreApp/AmoreAppGroup/MapAmoreApp.WebsiteInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:AmoreApp.AmoreAPI:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPI/Endpoint1" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:AmoreApp.Website:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.Website/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapAmoreApp.AmoreAPI:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPI/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAmoreApp.AmoreAPIInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPIInstances" />
          </setting>
        </map>
        <map name="MapAmoreApp.Website:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.Website/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapAmoreApp.WebsiteInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.WebsiteInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="AmoreApp.AmoreAPI" generation="1" functional="0" release="0" software="C:\code\AmoreApp\AmoreApp\csx\Release\roles\AmoreApp.AmoreAPI" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="8080" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AmoreApp.AmoreAPI&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AmoreApp.AmoreAPI&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AmoreApp.Website&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="AmoreApp.AmoreAPI.svclog" defaultAmount="[1000,1000,1000]" defaultSticky="true" kind="Directory" />
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPIInstances" />
            <sCSPolicyFaultDomainMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPIFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="AmoreApp.Website" generation="1" functional="0" release="0" software="C:\code\AmoreApp\AmoreApp\csx\Release\roles\AmoreApp.Website" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;AmoreApp.Website&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;AmoreApp.AmoreAPI&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;AmoreApp.Website&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.WebsiteInstances" />
            <sCSPolicyFaultDomainMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.WebsiteFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="AmoreApp.AmoreAPIFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="AmoreApp.WebsiteFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="AmoreApp.AmoreAPIInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="AmoreApp.WebsiteInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="6e565c6c-d527-4cb3-af0e-087075a6cfa3" ref="Microsoft.RedDog.Contract\ServiceContract\AmoreAppContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="54471ab1-bd50-4a3b-883b-eaea5c1e5225" ref="Microsoft.RedDog.Contract\Interface\AmoreApp.AmoreAPI:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.AmoreAPI:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="20c34bd8-fa4d-44a2-9f9f-4f7dcd7a5882" ref="Microsoft.RedDog.Contract\Interface\AmoreApp.Website:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/AmoreApp/AmoreAppGroup/AmoreApp.Website:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>