# DevPreview

A Windows Explorer Preview Pane handler for Markdown and source files.

## Spiritual successor to MarkdownPreview

DevPreview is the spiritual successor to [MarkdownPreview](https://github.com/Atrejoe/MarkdownPreview), the original project that proved the Explorer preview-pane approach. I kept some of the original files with the `MarkdownPreview` name intentionally: the COM registration model, SharpShell integration, preview control, signing setup, and solution structure are inherited foundations rather than needlessly renamed copies.

The original MarkdownPreview screenshot is retained as `sample.png` and remains the visual reference for the preview experience.

## Supported extensions

Markdown rendering:

- `.md`, `.markdown`

Safe source/text preview:

- `.py`, `.json`, `.html`, `.htm`, `.css`, `.js`, `.ts`
- `.xml`, `.yaml`, `.yml`, `.txt`, `.log`, `.ini`
- `.bat`, `.cmd`, `.ps1`, `.cs`, `.sql`

More extensions can be added by registering another SharpShell preview-handler class. Source files are displayed as escaped text, so HTML and scripts are never executed inside Explorer's preview pane.

## How it works

DevPreview is a native .NET Framework COM preview handler registered through SharpShell. Windows Explorer loads the handler directly for the registered file extensions, which means it works in the actual Explorer Preview Pane rather than a separate application window.

- Markdown is rendered with Markdig.
- Source and text files are displayed in a readable dark/light-aware code view.
- The handler uses the existing SharpShell preview-pane host integration from MarkdownPreview.
- Windows Explorer remains the host and controls file selection, sizing, and lifecycle.

## Build

Requirements:

- Windows
- .NET Framework 4.7.2 Developer Pack
- Visual Studio Build Tools with MSBuild
- NuGet

```text
nuget.exe restore MarkdownPreview.sln -PackagesDirectory packages
MSBuild.exe MarkdownPreview.Core\MarkdownPreview.Core.csproj /p:Configuration=Release
MSBuild.exe MarkdownPreview\MarkdownPreview.csproj /p:Configuration=Release
```

## Installation

The compiled handler must be registered as a SharpShell COM server with Explorer Preview Handler registration enabled. The original `Setup\Setup.vdproj` is retained as the starting point for the installer work.

After installation:

1. Enable Explorer's Preview Pane with `Alt+P`.
2. Select a supported file.
3. If Explorer is already open, restart Explorer after registration so it reloads the COM handler registrations.

## About

DevPreview is built by Joseph Williams / DrGekoz as a practical continuation of MarkdownPreview, expanded for everyday development files. The goal is simple: select a file in Windows Explorer and understand it immediately without opening an editor.

License: MIT, inherited from the original project.
