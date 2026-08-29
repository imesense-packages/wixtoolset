<Project>
  <PropertyGroup>
    <CentralPackageTransitivePinningEnabled>true</CentralPackageTransitivePinningEnabled>
  </PropertyGroup>

  <ItemGroup>
    <PackageVersion Include="ImeSense.WixToolset.Dtf.Compression" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dtf.Compression.Cab" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dtf.CustomAction" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dtf.Resources" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dtf.WindowsInstaller" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dtf.WindowsInstaller.Package" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixInternal.TestSupport" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixInternal.MSTestSupport" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixInternal.TestSupport.Native" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixInternal.BaseBuildTasks.Sources" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.DUtil" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.WcaUtil" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.BootstrapperApplicationApi" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.BootstrapperExtensionApi" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.WixStandardBootstrapperApplicationFunctionApi" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.Data" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Extensibility" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Versioning" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.Burn" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.Core" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Core.Burn" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Core.WindowsInstaller" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixInternal.Core.TestPackage" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixInternal.Core.MSTestPackage" Version="{packageversion}" />

    <PackageVersion Include="ImeSense.WixToolset.Bal.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.BootstrapperApplications.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.ComPlus.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Dependency.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.NetFx.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.UI.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Util.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Firewall.wixext" Version="{packageversion}" />
    <PackageVersion Include="ImeSense.WixToolset.Msmq.wixext" Version="{packageversion}" />
  </ItemGroup>

  <ItemGroup>
    <PackageVersion Include="System.Configuration.ConfigurationManager" Version="8.0.0" />
    <PackageVersion Include="System.Diagnostics.PerformanceCounter" Version="8.0.0" />
    <PackageVersion Include="System.DirectoryServices" Version="8.0.0" />
    <PackageVersion Include="System.DirectoryServices.AccountManagement" Version="8.0.0" />
    <PackageVersion Include="System.Management" Version="8.0.0" />
    <PackageVersion Include="System.Reflection.Metadata" Version="8.0.0" />
    <PackageVersion Include="System.Text.Encoding.CodePages" Version="8.0.0" />
    <PackageVersion Include="System.Text.Json" Version="8.0.6" />

    <PackageVersion Include="System.IO.Compression" Version="4.3.0" />
    <PackageVersion Include="System.IO.FileSystem.AccessControl" Version="5.0.0" />
    <PackageVersion Include="System.Net.NetworkInformation" Version="4.3.0" />
    <PackageVersion Include="System.Security.Principal.Windows" Version="5.0.0" />

    <PackageVersion Include="Microsoft.AspNetCore.Owin" Version="8.0.21" />
    <PackageVersion Include="Microsoft.VisualStudio.Setup.Configuration.Native" Version="3.14.2075" />
    <PackageVersion Include="Microsoft.Win32.Registry" Version="5.0.0" />

    <!-- Pin System.Private.Uri address security vulnerabilities in transitive dependencies. Review as dependencies update. -->
    <PackageVersion Include="System.Private.Uri" Version="4.3.2" />

    <!-- Use System.Memory v4.5.5 as it is compatible with VS2022 -->
    <PackageVersion Include="System.Memory" Version="4.5.5" />
  </ItemGroup>

  <!-- NuGet stack -->
  <ItemGroup>
    <PackageVersion Include="NuGet.Credentials" Version="6.13.2" />
    <PackageVersion Include="NuGet.Protocol" Version="6.13.2" />
    <PackageVersion Include="NuGet.Versioning" Version="6.13.2" />
  </ItemGroup>

  <!-- MSBuild (aligned with VS 17.13 toolset) -->
  <ItemGroup>
    <PackageVersion Include="Microsoft.Build.Tasks.Core" Version="17.13.26" />
  </ItemGroup>

  <!-- Keep the following versions in sync with internal\WixInternal.TestSupport.Native\packages.config -->
  <ItemGroup>
    <PackageVersion Include="Microsoft.SourceLink.GitHub" Version="8.0.0" />

    <PackageVersion Include="Microsoft.NET.Test.Sdk" Version="17.12.0" />
    <PackageVersion Include="xunit" Version="2.9.3" />
    <PackageVersion Include="xunit.runner.visualstudio" Version="2.8.2" />
    <PackageVersion Include="xunit.assert" Version="2.9.3" />
  </ItemGroup>

  <ItemGroup>
    <PackageVersion Include="MSTest.TestFramework" Version="4.0.1" />
  </ItemGroup>

  <ItemGroup>
    <PackageVersion Include="Microsoft.NET.Tools.NETCoreCheck.x86" Version="7.0.0" />
    <PackageVersion Include="Microsoft.NET.Tools.NETCoreCheck.x64" Version="7.0.0" />
    <PackageVersion Include="Microsoft.NET.Tools.NETCoreCheck.arm64" Version="7.0.0" />
  </ItemGroup>
</Project>
