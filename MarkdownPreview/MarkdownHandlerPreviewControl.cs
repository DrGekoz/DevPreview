using SharpShell.SharpPreviewHandler;
using System;
using System.IO;
using System.Windows.Forms;
using static MarkdownPreview.Core.Engine;

namespace MarkdownPreview
{
    public partial class MarkdownHandlerPreviewControl : PreviewHandlerControl
    {
        public MarkdownHandlerPreviewControl() { InitializeComponent(); }

        public void DoPreview(string selectedFilePath)
        {
            try
            {
                if (!File.Exists(selectedFilePath)) return;
                webBrowser.DocumentText = FileToHtml(selectedFilePath);
                webBrowser.Invalidate();
            }
            catch (Exception ex)
            {
                webBrowser.DocumentText = CodeToHtml("Unable to preview this file.\r\n\r\n" + ex.Message, ".txt", Path.GetFileName(selectedFilePath));
            }
        }
    }
}
