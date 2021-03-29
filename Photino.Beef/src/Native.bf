using System;
using System;
using System.Interop;
using static System.Windows;

namespace Photino.Beef
{

	// Rn only windows implementation will be present

	public function void WebMessageReceivedCallback(String message);

	public function void InvokeCallback();

	//public function int 


	class Native
	{
		[CLink, Import("Photino.Native.dll")]
		public static extern void Photino_register_win32(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_getHwnd_win32(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_ctor(
			String title,
			hPhotino parent,
			WebMessageReceivedCallback webMessageReceivedCallback,
			bool fullscreen,
			c_int x, c_int y,
			c_int width, c_int height);

		
		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_dtor(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_SetTitle(hPhotino instance, String title);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_Show(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_Close(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_WaitForExit(hPhotino instance);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_ShowMessage(hPhotino instance, String title, String body, MessageType type);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_Invoke(hPhotino instance, InvokeCallback callback);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_NavigateToString(hPhotino instance, String content);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_NavigateToUrl(hPhotino instance, String url);

		[CLink, Import("Photino.Native.dll")]
		public static extern HWnd Photino_SendWebMessage(hPhotino instance, String message);

	}
}
