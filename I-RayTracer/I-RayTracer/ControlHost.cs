using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Interop;
using System.Runtime.InteropServices;



namespace I_RayTracer
{
    public class ControlHost : HwndHost
    {



        //private const int WS_CHILD = 0x40000000;

        [DllImport("user32.dll")]

        private static extern int SetParent(IntPtr hWndChild, IntPtr hWndParent);





        [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]

        private static extern uint SetWindowLong(IntPtr hwnd, int nIndex, uint newLong);



        [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]

        private static extern uint GetWindowLong(IntPtr hwnd, int nIndex);



        [DllImport("user32.dll", EntryPoint = "DestroyWindow", CharSet = CharSet.Unicode)]

        internal static extern bool DestroyWindow(IntPtr hwnd);



        IntPtr hwndControl;

        IntPtr hwndHost;

        int hostHeight, hostWidth;

        [System.Runtime.InteropServices.DllImport("user32.dll", EntryPoint = "FindWindow")]

        public static extern IntPtr FindWindow(

                  string lpClassName,

                  string lpWindowName

                 );



        public ControlHost(double height, double width)
        {

            hostHeight = (int)height;

            hostWidth = (int)width;

        }



        protected override HandleRef BuildWindowCore(HandleRef hwndParent)
        {

            hwndControl = IntPtr.Zero;

            hwndHost = IntPtr.Zero;



            //test2.Class1 test = new test2.Class1();

            // MWArray m = 1, n = 2;

            //test.test2();


            System.Threading.Thread.Sleep(1000);



            hwndControl = FindWindow(null, "Figure 1");//Figure 1 是弹出的Figure的名字
            uint oldStyle = GetWindowLong(hwndControl, GWL_STYLE);



            SetWindowLong(hwndControl, GWL_STYLE, (WS_DLGFRAME | WS_CHILD)); // WS_DLGFRAME 是创建一个无标题的窗口    

            //将 嵌入的Figure的父窗口设置为HwndHost

            SetParent(hwndControl, hwndParent.Handle);



            return new HandleRef(this, hwndControl);

        }



        protected override IntPtr WndProc(IntPtr hwnd, int msg, IntPtr wParam, IntPtr lParam, ref bool handled)
        {

            handled = false;

            return IntPtr.Zero;

        }



        protected override void DestroyWindowCore(HandleRef hwnd)
        {

            DestroyWindow(hwnd.Handle);

        }

        public IntPtr hwndListBox
        {

            get { return hwndControl; }

        }



        internal const int

         WS_CHILD = 0x40000000,

         WS_VISIBLE = 0x10000000,

         LBS_NOTIFY = 0x00000001,

         HOST_ID = 0x00000002,

         LISTBOX_ID = 0x00000001,

         WS_VSCROLL = 0x00200000,

         WS_BORDER = 0x00800000,

         GWL_STYLE = -16,

         WS_DLGFRAME = 0x00400000;

    }
}
