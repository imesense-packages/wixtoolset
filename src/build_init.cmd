@setlocal
@pushd %~dp0

md ..\build\artifacts
md ..\build\logs\crashdumps
md ..\build\logs\TestResults

msbuild internal\SetBuildNumber\SetBuildNumber.proj -nologo

@popd
@endlocal
