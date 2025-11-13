<!-- dotnet.md -*- mode: gfm-mode -*- -->
<!--
Summary:

Tags:
-->
Directory Prefix: "cs_" and "fs_"


# [Dotnet](https://github.com/dotnet)
# adding new modules
```dotnet new {template} -o {dirname}```
from the project root.

# adding new dependencies
```dotnet nuget add```

# Repo Config Files
## nuget.config

## Directory.Build.props
https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-by-directory?view=vs-2022

use the following in a `Directory.Build.Props` to import higher up props files:
```xml
  <Import Project="$([MSBuild]::GetPathOfFileAbove('Directory.Build.props', '$(MSBuildThisFileDirectory)../'))" Condition="'' != $([MSBuild]::GetPathOfFileAbove('Directory.Build.props', '$(MSBuildThisFileDirectory)../'))" />

```

## .sln
Create with ```dotnet new sln```
Modify with ```dotnet sln add {proj}```

- https://learn.microsoft.com/en-us/visualstudio/extensibility/internals/solution-dot-sln-file?view=vs-2022

# Package Config Files
## .csproj / .fsproj

To have a root project and exclude a tests folder:

```xml
<ItemGroup>
    <Compile Remove="__tests/*"/>
</ItemGroup>
```

While Test subprojects incude a reference:
```xml
<ItemGroup>
    <ProjectReference Include="$(MSBuildThisFileDirectory)../{}.csproj" />
</ItemGroup>
```


- https://learn.microsoft.com/en-us/visualstudio/msbuild/msbuild-project-file-schema-reference?view=vs-2022
- https://learn.microsoft.com/en-us/visualstudio/msbuild/msbuild-reserved-and-well-known-properties?view=vs-2022
- https://learn.microsoft.com/en-us/visualstudio/msbuild/task-writing?view=vs-2022
- https://learn.microsoft.com/en-us/visualstudio/msbuild/msbuild-task-reference?view=vs-2022

## .suo
## Directory.Build.targets
https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-by-directory?view=vs-2022

## Directory.Packages.props
