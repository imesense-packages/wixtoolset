# WixToolset.Sdk

The `WixToolset.Sdk` package provides the WiX Toolset as an MSBuild SDK for both .NET (v6 or later) and .NET Framework (v4.7.2 or later). SDK-style projects have smart defaults that make for simple .wixproj project authoring.

[Web Site][web] | [Documentation][docs] | [Issue Tracker][issues] | [Discussions][discussions]


## Getting started

Here's a minimal .wixproj that builds an MSI from the .wxs source files in the project directory:

Example project file: `QuickStart.wixproj`
```
<Project Sdk="WixToolset.Sdk/7.0.0">
</Project>
```

Example source code: `QuickStart.wxs`
```
<Wix xmlns="http://wixtoolset.org/schemas/v4/wxs">
  <Package Id="AcmeCorp.QuickStart" Name="QuickStart Example" Manufacturer="ACME Corp" Version="0.0.1">
    <File Source="example.txt" />
  </Package>
</Wix>
```

Build your MSI from the command-line:
```
dotnet build
```

For more information about WiX as an MSBuild SDK, see https://docs.firegiant.com/wix/using-wix/#msbuild-and-dotnet-build.

For more information about WiX targets, properties, and items, see https://docs.firegiant.com/wix/tools/msbuild/.


## Additional resources

* [WiX Website][web]
* [WiX Documentation][docs]
* [WiX Issue Tracker][issues]
* [WiX Discussions][discussions]


[web]: https://www.firegiant.com/wixtoolset/
[docs]: https://docs.firegiant.com/wixtoolset/
[issues]: https://github.com/wixtoolset/issues/issues
[discussions]: https://github.com/orgs/wixtoolset/discussions
[sdk]: https://www.nuget.org/packages/WixToolset.Sdk/
[license]: https://github.com/wixtoolset/wix/blob/main/LICENSE.TXT
