using SharpShell.Attributes;
using SharpShell.SharpPreviewHandler;
using System;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MarkdownPreview
{
    public abstract class UniversalPreviewHandler : SharpPreviewHandler
    {
        protected override PreviewHandlerControl DoPreview()
        {
            var control = new MarkdownHandlerPreviewControl();
            control.VerticalScroll.Enabled = true;
            var path = SelectedFilePath;
            Task.Delay(50).ContinueWith(t =>
            {
                if (!string.IsNullOrEmpty(path)) control.DoPreview(path);
            }, TaskScheduler.FromCurrentSynchronizationContext());
            return control;
        }
    }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".md"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class MarkdownPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".markdown"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class MarkdownExtensionPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".py"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class PythonPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".json"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class JsonPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".html"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class HtmlPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".htm"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class HtmPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".css"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class CssPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".js"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class JavaScriptPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".ts"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class TypeScriptPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".xml"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class XmlPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".yaml"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class YamlPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".yml"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class YmlPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".txt"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class TextPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".log"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class LogPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".ini"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class IniPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".bat"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class BatchPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".ps1"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class PowerShellPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".cs"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class CSharpPreviewHandler : UniversalPreviewHandler { }

    [ComVisible(true), COMServerAssociation(AssociationType.ClassOfExtension, ".sql"), DisplayName("Universal File Preview"), PreviewHandler]
    public sealed class SqlPreviewHandler : UniversalPreviewHandler { }
}
