#include <windows.h>
#include <shobjidl.h>
#include <shlwapi.h>
#include <string>
#include <vector>
#pragma comment(lib, "shlwapi.lib")

static const CLSID CLSID_DevPreview = {0x8b4fb2d1,0x2f50,0x4d64,{0x9a,0x71,0x34,0x5a,0x9f,0x70,0x4c,0x1e}};
static HINSTANCE g_instance;

class Preview final : public IPreviewHandler, public IInitializeWithFile {
 LONG refs=1; HWND parent=nullptr, host=nullptr; std::wstring file; PROCESS_INFORMATION pi{};
public:
 ULONG AddRef(){return InterlockedIncrement(&refs);} ULONG Release(){auto n=InterlockedDecrement(&refs);if(!n)delete this;return n;}
 HRESULT QueryInterface(REFIID riid, void** pp){if(!pp)return E_POINTER;*pp=nullptr;if(riid==IID_IUnknown||riid==IID_IPreviewHandler)*pp=(IPreviewHandler*)this;else if(riid==IID_IInitializeWithFile)*pp=(IInitializeWithFile*)this;else return E_NOINTERFACE;AddRef();return S_OK;}
 HRESULT SetWindow(HWND hwnd, const RECT*){parent=hwnd;return S_OK;}
 HRESULT SetRect(const RECT* r){if(host&&r)SetWindowPos(host,nullptr,r->left,r->top,r->right-r->left,r->bottom-r->top,SWP_NOZORDER|SWP_NOACTIVATE);return S_OK;}
 HRESULT DoPreview(){if(!parent||file.empty())return E_FAIL;RECT r;GetClientRect(parent,&r);host=CreateWindowExW(0,L"STATIC",L"",WS_CHILD|WS_VISIBLE,r.left,r.top,r.right,r.bottom,parent,nullptr,g_instance,nullptr);std::wstring cmd=L"\""+std::wstring(L"C:\\Program Files\\DevPreview\\DevPreview.Renderer.exe")+L"\" --parent "+std::to_wstring((UINT_PTR)host)+L" --file \""+file+L"\"";STARTUPINFOW si{sizeof(si)};std::vector<wchar_t> b(cmd.begin(),cmd.end());b.push_back(0);if(!CreateProcessW(nullptr,b.data(),nullptr,nullptr,FALSE,0,nullptr,nullptr,&si,&pi))return HRESULT_FROM_WIN32(GetLastError());return S_OK;}
 HRESULT Unload(){if(pi.hProcess){TerminateProcess(pi.hProcess,0);CloseHandle(pi.hProcess);CloseHandle(pi.hThread);pi={};}if(host){DestroyWindow(host);host=nullptr;}return S_OK;}
 HRESULT SetFocus(){return host?::SetFocus(host),S_OK:E_FAIL;} HRESULT QueryFocus(HWND* p){if(!p)return E_POINTER;*p=GetFocus();return S_OK;} HRESULT TranslateAccelerator(MSG*){return S_FALSE;}
 HRESULT Initialize(LPCWSTR p,DWORD){if(!p)return E_INVALIDARG;file=p;return S_OK;}
};

class Factory final: public IClassFactory {LONG refs=1;public:ULONG AddRef(){return InterlockedIncrement(&refs);}ULONG Release(){auto n=InterlockedDecrement(&refs);if(!n)delete this;return n;}HRESULT QueryInterface(REFIID r,void**p){if(!p)return E_POINTER;*p=nullptr;if(r==IID_IUnknown||r==IID_IClassFactory){*p=this;AddRef();return S_OK;}return E_NOINTERFACE;}HRESULT CreateInstance(IUnknown*o,REFIID r,void**p){if(o)return CLASS_E_NOAGGREGATION;auto x=new Preview();auto h=x->QueryInterface(r,p);x->Release();return h;}HRESULT LockServer(BOOL){return S_OK;}};
STDAPI DllGetClassObject(REFCLSID r, REFIID i, void** p){if(r!=CLSID_DevPreview)return CLASS_E_CLASSNOTAVAILABLE;auto f=new Factory();auto h=f->QueryInterface(i,p);f->Release();return h;}
STDAPI DllCanUnloadNow(){return S_FALSE;}
extern "C" __declspec(dllexport) HRESULT __stdcall DllRegisterServer(){return S_OK;}
extern "C" __declspec(dllexport) HRESULT __stdcall DllUnregisterServer(){return S_OK;}
BOOL APIENTRY DllMain(HINSTANCE h,DWORD r,LPVOID){if(r==DLL_PROCESS_ATTACH){g_instance=h;DisableThreadLibraryCalls(h);}return TRUE;}
