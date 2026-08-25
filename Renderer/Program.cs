using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using MarkdownPreview.Core;
class Program {
 [DllImport("user32.dll")] static extern IntPtr SetParent(IntPtr child, IntPtr parent);
 [DllImport("user32.dll")] static extern bool GetClientRect(IntPtr h, out RECT r);
 [DllImport("user32.dll")] static extern bool MoveWindow(IntPtr h,int x,int y,int w,int hgt,bool repaint);
 [StructLayout(LayoutKind.Sequential)] struct RECT { public int l,t,r,b; }
 [STAThread] static void Main(string[] args){ string file=null; IntPtr parent=IntPtr.Zero; for(int i=0;i<args.Length;i++){if(args[i]=="--file"&&i+1<args.Length)file=args[++i];if(args[i]=="--parent"&&i+1<args.Length)parent=(IntPtr)long.Parse(args[++i]);} if(string.IsNullOrEmpty(file)||parent==IntPtr.Zero)return; Application.EnableVisualStyles(); var f=new Form{FormBorderStyle=FormBorderStyle.None,TopLevel=false,ShowInTaskbar=false}; var b=new WebBrowser{Dock=DockStyle.Fill,ScriptErrorsSuppressed=true,AllowNavigation=false}; f.Controls.Add(b); f.Load+=(s,e)=>{SetParent(f.Handle,parent); GetClientRect(parent,out var r); MoveWindow(f.Handle,0,0,r.r-r.l,r.b-r.t,true); b.DocumentText=Engine.FileToHtml(file);}; f.Show(); Application.Run(); }
}
