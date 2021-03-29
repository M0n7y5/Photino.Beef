using System;
using System.Interop;
using static System.Windows;

namespace Photino.Beef
{
	typealias hPhotino = Windows.HInstance;

	[AllowDuplicates]
	enum MessageType : c_int
	{
		MB_OK,
		MB_OKCANCEL,
		MB_ABORTRETRYIGNORE,
		MB_YESNOCANCEL,
		MB_YESNO,
		MB_RETRYCANCEL,
		MB_CANCELTRYCONTINUE,
		MB_HELP = 0x4000,

		MB_ICONEXCLAMATION = 0x30,
		MB_ICONWARNING = 0x30,
		MB_ICONINFORMATION = 0x40,
		MB_ICONASTERISK = 0x40,
		MB_ICONQUESTION = 0x20,
		MB_ICONSTOP = 0x10,
		MB_ICONERROR = 0x10,
		MB_ICONHAND = 0x10
	}

	[CRepr]
	struct NativeRect
		: this(c_int x, c_int y, c_int width, c_int height)
	{
	}

	[CRepr]
	struct NativeMonitor
		: this(NativeRect monitor, NativeRect work)
	{
	}

	struct Rectangle
		: this(c_int left, c_int top, c_int width, c_int height)
	{
	}

	public struct Monitor
	{
		public readonly Rectangle MonitorArea;
		public readonly Rectangle WorkArea;

		public this(Rectangle monitor, Rectangle work)
		{
			MonitorArea = monitor;
			WorkArea = work;
		}

		internal this(NativeRect monitor, NativeRect work)
			: this(Rectangle(monitor.x, monitor.y, monitor.width, monitor.height),
			Rectangle(work.x, work.y, work.width, work.height))
			{ }

		internal this(NativeMonitor nativeMonitor)
			: this(nativeMonitor.monitor, nativeMonitor.work)
			{ }
	}
}
