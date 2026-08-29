# WixToolset.NetFx.wixext - .NET Framework WiX Toolset Extension

This WiX Extension provides support for configuring .NET Framework.

[Web Site][web] | [Documentation][docs] | [Issue Tracker][issues] | [Discussions][discussions]


## Getting started

Add the WiX Extension as a PackageReference to your .wixproj:

```
<Project Sdk="WixToolset.Sdk/7.0.0">
  <ItemGroup>
    <PackageReference Include="WixToolset.NetFx.wixext" Version="7.0.0" />
  </ItemGroup>
</Project>
```

Then add the extension's namespace:

```
<Wix xmlns="http://wixtoolset.org/schemas/v4/wxs"
     xmlns:netfx="http://wixtoolset.org/schemas/v4/wxs/netfx">

  ..
</Wix>
```

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
