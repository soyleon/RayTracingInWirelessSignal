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
using System.Collections.ObjectModel;
using MathWorks.MATLAB.NET.Arrays;
using MathWorks.MATLAB.NET.Utility;
using raytracing;

namespace I_RayTracer
{
    /// <summary>
    /// IndoorWindow.xaml 的交互逻辑
    /// </summary>
    public partial class IndoorWindow : Window
    {
        private Ray_tracing_parament rayparameter = new Ray_tracing_parament(10,5000000000,5,0,0,0,0,"white noise", 0);
        ObservableCollection<Scene_paramenters> sceneparamenters = new ObservableCollection<Scene_paramenters>();
        public void InitSceneData()
            {
                Scene_paramenters InitSecne = new Scene_paramenters();
                double[] InitLocation = { 1, 0, 0, 0 };
                InitSecne.Scene_object = "wall";
                InitSecne.Material = "Concret";
                InitSecne.Conductivity = 0.0001;
                InitSecne.Permitivity = 6.4;
                InitSecne.Location = InitLocation;
                
                sceneparamenters.Add(InitSecne);
            }
        public IndoorWindow()
        {
            InitializeComponent();
            InitSceneData();
            this.Power_Tx_textbox.Text = rayparameter.Power_Tx.ToString();
            this.Frequency_Tx_textbox.Text = rayparameter.Frequency_Tx.ToString();
            this.Max_reflection_textbox.Text = rayparameter.Max_reflection.ToString();
            this.Max_diffraction_textbox.Text = rayparameter.Max_diffraction.ToString();
            this.Max_Scattering_textbox.Text = rayparameter.Max_scattering.ToString();
            this.Dopplershift_textbox.Text = rayparameter.Dopplershift.ToString();
            this.Bandwidth_textbox.Text = rayparameter.Bandwidth.ToString();
            this.Noisemod_textbox.Text = rayparameter.Noisemod;
            this.Threshold_Rx_textbox.Text = rayparameter.Threshold_Rx.ToString();
            this.DataContext = rayparameter;
            //Indoor_Window_Object_Material.Items.Clear();
            Indoor_Window_Object_Material.ItemsSource = sceneparamenters;

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
            double[] Location_Tx = { 1, 14, 1 };
            double[] Location_Rx = { 2, 12, 2 };

            MWNumericArray Location_Tx_m = new MWNumericArray(1, 3, Location_Tx);
            MWNumericArray Location_Rx_m = new MWNumericArray(1, 3, Location_Rx);
            Console.Write(Location_Tx_m.ToString());


            MWArray[] agrsOut = new MWArray[14];
            raytracingClass raytracing_m = new raytracingClass();
            agrsOut = raytracing_m.raytracing(14, 0, rayparameter.Power_Tx, rayparameter.Frequency_Tx, 6.4, 0.0004, 1, 1, Location_Tx_m, Location_Rx_m, 0);
            OutputWindow OutputWin = new OutputWindow();
            OutputWin.Show();
        }

        private void Indoor_Window_Object_Material_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }


    }
}
