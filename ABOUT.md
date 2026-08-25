# About DevPreview

DevPreview is a spiritual successor to MarkdownPreview by Atrejoe.

It keeps the original SharpShell preview-handler foundation and intentionally retains several `MarkdownPreview`-named files because they are part of the working COM/Explorer integration. The project expands that foundation to Python, JSON, HTML, JavaScript, CSS, XML, YAML, PowerShell, C#, SQL, logs, configuration files, and ordinary text files.

The important distinction is that DevPreview is an Explorer shell extension. It is not a standalone editor and it does not open a replacement window. Windows Explorer loads it in the real Preview Pane.

HTML and script files are shown as escaped source text. They are not executed by the preview handler.

Original project and visual reference:
https://github.com/Atrejoe/MarkdownPreview

DevPreview author:
Joseph Williams / DrGekoz
