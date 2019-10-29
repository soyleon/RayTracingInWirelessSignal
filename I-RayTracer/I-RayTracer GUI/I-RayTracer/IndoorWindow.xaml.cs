using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace I_RayTracer
{
    /// <summary>
    /// IndoorWindow.xaml 的交互逻辑
    /// </summary>
    public partial class IndoorWindow : Window
    {
        public IndoorWindow()
        {
            InitializeComponent();
        }

        private void Indoor_Button_Return_Click(object sender, RoutedEventArgs e)
        {
            MainWindow Mainwin = new MainWindow();
            Mainwin.Show();
            this.Close();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Indoor_Button_Fopen_Click(object sender, RoutedEventArgs e)
        {
            // Create OpenFileDialog
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();

            // Set filter for file extension and default file extension
            dlg.DefaultExt = ".txt";
            dlg.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif)|*.gif";

            // Display OpenFileDialog by calling ShowDialog method
            Nullable<bool> result = dlg.ShowDialog();

            // Get the selected file name and display in a TextBox
            if (result == true)
            {
                // Open document
                string filename = dlg.FileName;
                this.Indoor_TextBox_FileName.Text = filename;
            }
        }

        private void Indoor_Antenna_Add_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Indoor_Antenna_Save_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Indoor_Antenna_Delete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Indoor_SceneParamterSetting_Add_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Indoor_SceneParamterSetting_Save_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Indoor_SceneParamterSetting_Delete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void IndoorWindow_Simulation_Eixt_Click(object sender, RoutedEventArgs e)
        {         
            if (MessageBox.Show("Do you want to Exit","Warning",MessageBoxButton.OKCancel,MessageBoxImage.Exclamation) == MessageBoxResult.OK)
            { this.Close(); }
            else
            { }



        }

        private void IndoorWindow_Simulation_Apply_Click(object sender, RoutedEventArgs e)
        {
            OutputWindow OutputWin = new OutputWindow();
            OutputWin.Show();
        }
    }
}
