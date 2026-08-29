@echo off

setlocal
pushd %~dp0

set _NUGET_CACHE=%USERPROFILE%\.nuget\packages
if "%NUGET_PACKAGES%" NEQ "" set _NUGET_CACHE=%NUGET_PACKAGES%

echo Cleaning...

if exist ..\build rd /s/q ..\build
if exist ..\packages rd /s/q ..\packages

if exist Directory.Packages.props (del Directory.Packages.props)
if exist global.json (del global.json)

if exist ..\Directory.Packages.props (del ..\Directory.Packages.props)
if exist ..\global.json (del ..\global.json)

if exist "%_NUGET_CACHE%\wixinternal.basebuildtasks.sources" rd /s/q "%_NUGET_CACHE%\wixinternal.basebuildtasks.sources"
if exist "%_NUGET_CACHE%\wixinternal.testsupport" rd /s/q "%_NUGET_CACHE%\wixinternal.testsupport"
if exist "%_NUGET_CACHE%\wixinternal.mstestsupport" rd /s/q "%_NUGET_CACHE%\wixinternal.mstestsupport"
if exist "%_NUGET_CACHE%\wixinternal.core.testpackage" rd /s/q "%_NUGET_CACHE%\wixinternal.core.testpackage"
if exist "%_NUGET_CACHE%\wixinternal.core.mstestpackage" rd /s/q "%_NUGET_CACHE%\wixinternal.core.mstestpackage"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.bal.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.bal.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperapplications.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperapplications.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperextensionapi" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperextensionapi"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.bextutil" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.bextutil"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.burn" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.burn"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.complus.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.complus.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.converters" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.converters"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.core" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.core"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.core.burn" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.core.burn"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.core.extensioncache" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.core.extensioncache"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.core.native" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.core.native"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.core.windowsinstaller" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.core.windowsinstaller"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.data" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.data"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dependency.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dependency.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.directx.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.directx.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression.cab" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression.cab"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression.zip" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.compression.zip"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.customaction" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.customaction"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.resources" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.resources"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller.linq" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller.linq"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller.package" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dtf.windowsinstaller.package"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.dutil" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.dutil"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.extensibility" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.extensibility"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.firewall.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.firewall.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.http.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.http.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.iis.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.iis.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperapplicationapi" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.bootstrapperapplicationapi"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.msmq.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.msmq.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.netfx.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.netfx.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.powershell.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.powershell.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.sdk" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.sdk"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.sql.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.sql.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.util.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.util.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.ui.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.ui.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.versioning" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.versioning"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.visualstudio.wixext" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.visualstudio.wixext"
if exist "%_NUGET_CACHE%\imesense.wixtoolset.wcautil" rd /s/q "%_NUGET_CACHE%\imesense.wixtoolset.wcautil"
if exist "%_NUGET_CACHE%\wix" rd /s/q "%_NUGET_CACHE%\wix"

popd
endlocal
