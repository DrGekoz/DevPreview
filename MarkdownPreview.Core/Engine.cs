using Markdig;
using Microsoft.Win32;
using System;
using System.IO;
using System.Reflection;
using System.Security;
using System.Text;

namespace MarkdownPreview.Core
{
    public static class Engine
    {
        private static readonly string[] MarkdownExtensions = { ".md", ".markdown" };

        public static string FileToHtml(string path)
        {
            string extension = Path.GetExtension(path).ToUpperInvariant();
            string content = File.ReadAllText(path, Encoding.UTF8);
            if (Array.IndexOf(MarkdownExtensions, extension.ToLowerInvariant()) >= 0)
                return MarkDownToHtml(content);
            return CodeToHtml(content, extension, Path.GetFileName(path));
        }

        public static string MarkDownToHtml(string markdown)
        {
            var pipeline = new MarkdownPipelineBuilder().UseAdvancedExtensions().Build();
            string text = Markdown.ToHtml(markdown ?? string.Empty, pipeline);
            return Document(text, false, "Markdown preview");
        }

        public static string CodeToHtml(string source, string extension, string fileName)
        {
            string language = extension.TrimStart('.').ToUpperInvariant();
            string escaped = SecurityElement.Escape(source ?? string.Empty);
            string header = "<div class=\"file\"><strong>" + SecurityElement.Escape(fileName) + "</strong><span>" + language + " source</span></div>";
            return Document(header + "<pre><code>" + escaped + "</code></pre>", true, "Source preview");
        }

        private static string Document(string body, bool source, string title)
        {
            string css = GetCss();
            string sourceCss = source ? "pre { white-space: pre-wrap; word-wrap: break-word; } pre code { color:#d6deeb; } .file { display:flex; justify-content:space-between; color:#7f8c98; font-size:12px; margin-bottom:12px; }" : "";
            return "<!DOCTYPE html><html><head><meta charset=\"utf-8\"><title>" + title + "</title><style>" + css + sourceCss + "</style></head><body>" + body + "</body></html>";
        }

        public static string GetCss()
        {
            var assembly = Assembly.GetExecutingAssembly();
            string resourceName = assembly.GetName().Name + ".markdownpad-github.css";
            using (Stream stream = assembly.GetManifestResourceStream(resourceName))
            using (var reader = new StreamReader(stream))
            {
                var sb = new StringBuilder(reader.ReadToEnd());
                if (IsDarkMode()) sb.Append("body { background-color:#202020; color:#f1f1f1; } body, h1, h2, h3, h4, h5 { color:#f1f1f1; } a { color:#6cb6ff; }");
                return sb.ToString();
            }
        }

        public static bool IsDarkMode()
        {
            try
            {
                object result = Registry.GetValue(@"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme", null);
                return result is int && (int)result == 0;
            }
            catch (IOException) { return false; }
            catch (SecurityException) { return false; }
            catch (ArgumentException) { return false; }
        }
    }
}
