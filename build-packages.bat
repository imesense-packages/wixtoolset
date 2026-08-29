@echo off
setlocal
pushd %~dp0

:: =============================================================================
:: build-packages.bat
::
:: Full release build of the WiX Toolset that produces NuGet packages in
:: build\artifacts, without running unit/integration tests.
::
:: Mirrors src\build_all.cmd but calls the build steps of each stage directly,
:: skipping the "dotnet test" steps of the per-stage *.cmd scripts.
::
:: Usage:
::   build-packages.bat          - full clean build (Release)
::   build-packages.bat inc      - incremental build (skips cleaning)
::   build-packages.bat clean    - clean only
:: =============================================================================

set _INCREMENTAL=
set _CLEAN=

:parse_args
if /i "%1"=="inc" set _INCREMENTAL=1
if /i "%1"=="clean" set _CLEAN=1
if not "%1"=="" shift & goto parse_args

if not "%_INCREMENTAL%"=="1" call src\clean.cmd
if not "%_CLEAN%"=="" goto end

:: ---------------------------------------------------------------------------
:: Initialize the VS 2026 (v18) developer command prompt.
:: Skipped when the environment is already initialized (VCToolsVersion set)
:: or when WixSkipVsDevCmd is defined.
:: ---------------------------------------------------------------------------

if not "%VCToolsVersion%"=="" goto :env_ready
if not "%WixSkipVsDevCmd%"=="" goto :env_ready

echo Initializing VS2026 developer command prompt

set _VSDEVCMD=
for /f "usebackq delims=" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -version [18^,19^) -property installationPath`) do (
    if exist "%%i\Common7\Tools\vsdevcmd.bat" set _VSDEVCMD=%%i\Common7\Tools\vsdevcmd.bat
)

if "%_VSDEVCMD%"=="" (
    echo VS2026 developer command prompt not found
    exit /b 2
)

call "%_VSDEVCMD%" -no_logo || exit /b

:env_ready

:: ---------------------------------------------------------------------------
:: Initialize required files/folders and version info (SomeVer).
:: ---------------------------------------------------------------------------

call src\build_init.cmd || exit /b

:: ---------------------------------------------------------------------------
:: Stage: dtf - DTF libraries + SfxCA native custom action infrastructure.
:: ---------------------------------------------------------------------------

echo Building dtf Release

msbuild -Restore src\dtf\SfxCA\sfxca_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\dtf_sfxca.binlog || exit /b

msbuild -Restore -t:Pack src\dtf\dtf.slnx -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\dtf_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: internal - WixInternal.* support packages.
:: ---------------------------------------------------------------------------

echo Building internal Release

pushd src\internal
nuget restore || exit /b
popd

msbuild src\internal\internal_t.proj -p:Configuration=Release -nologo -warnaserror -bl:build\logs\internal_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: libs - dutil, wcautil, Versioning.
:: ---------------------------------------------------------------------------

echo Building libs Release

msbuild -Restore src\libs\libs_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\libs_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: api - Data, Extensibility, Bootstrapper APIs, balutil, bextutil.
:: ---------------------------------------------------------------------------

echo Building api Release

msbuild src\api\api_t.proj -p:Configuration=Release -nologo -warnaserror -bl:build\logs\api_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: burn - Bootstrapper engine (native).
:: ---------------------------------------------------------------------------

echo Building burn Release

pushd src\burn
nuget restore || exit /b
popd

msbuild src\burn\burn_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\burn_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: wix - Core, native wixnative, CLI, SDK, converters, build tasks.
:: ---------------------------------------------------------------------------

echo Building wix Release

msbuild -t:Restore src\wix\wix.slnx -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\wix_restore.binlog || exit /b

msbuild src\wix\wixnative\wixnative_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\wixnative_build.binlog || exit /b

msbuild src\wix\wix.slnx -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\wix_build.binlog || exit /b

msbuild src\wix\publish_t.proj -p:Configuration=Release -nologo -warnaserror -bl:build\logs\wix_publish.binlog || exit /b

msbuild -t:Publish -p:Configuration=Release -nologo -warnaserror src\wix\WixToolset.Sdk\WixToolset.Sdk.csproj -bl:build\logs\wix_sdk_publish.binlog || exit /b

msbuild src\wix\pack_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\wix_pack.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: tools - build-time tools.
:: ---------------------------------------------------------------------------

echo Building tools Release

msbuild -Restore src\tools\tools_t.proj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\tools.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: ext - all WiX extensions (Bal, ComPlus, Dependency, Firewall, ...).
:: ---------------------------------------------------------------------------

echo Building ext Release

:: Restore packages.config of the netcoresearch native project (provides hostfxr.h / hostfxr.dll).
nuget restore src\ext\NetFx\netcoresearch\packages.config -SolutionDirectory . || exit /b

msbuild src\ext\ext_t.proj -p:Configuration=Release -p:SuppressWixClean=true -m -nologo -warnaserror -bl:build\logs\ext_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: setup - wix-cli-x64 and WixAdditionalTools redistributables.
:: ---------------------------------------------------------------------------

echo Building setup Release

msbuild -Restore src\setup\MetadataTask\MetadataTask.csproj -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\setup_task.binlog || exit /b

msbuild -Restore src\setup\setup.slnx -p:Configuration=Release -nologo -m -warnaserror -bl:build\logs\setup_build.binlog || exit /b

:: ---------------------------------------------------------------------------
:: Stage: finalize - zip PDBs (Release only).
:: ---------------------------------------------------------------------------

echo Finalizing build Release

msbuild -Restore src\internal\WixBuildFinalize\WixBuildFinalize.proj -p:Configuration=Release -nologo || exit /b

echo.
echo Build completed. Packages: build\artifacts

:end
popd
endlocal
