using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace I_RayTracer
{
    class Ray_tracing_parament:INotifyPropertyChanged 
    {
        //该接口只有一个事件propertyChange定义
        public event PropertyChangedEventHandler PropertyChanged;
        // Notify方法
        protected void Notify(string propName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propName));
            }
        }
        private double power_Tx ; // the unit of power_transmitter is mw;
        private double frequency_Tx ;
        private int max_reflection ;
        private int max_diffraction ;
        private int max_scattering ; //sacttering time represent the number of scatering rays;
        private double dopplershift ;
        private double bandwidth ;
        private string noisemod ;
        private double threshold_Rx;

        public double Power_Tx
        {
            get { return power_Tx; }
            set
            {
                if (power_Tx == value) return;
                power_Tx = value;
                Notify("Power_Tx");
            }
        }

        public double Frequency_Tx
        {
            get { return frequency_Tx; }
            set
            {
                if (frequency_Tx == value) return;
                frequency_Tx = value;
                Notify("Frequency_Tx");
            }
        }

        public int Max_reflection
        {
            get { return max_reflection; }
            set
            {
                if (max_reflection == value) return;
                max_reflection = value;
                Notify("Max_reflection");
            }
        }

        public int Max_diffraction
        {
            get { return max_diffraction; }
            set
            {
                if (max_diffraction == value) return;
                max_diffraction = value;
                Notify("Max_diffraction");
            }
        }

        public int Max_scattering
        {
            get { return max_scattering; }
            set
            {
                if (max_scattering == value) return;
                max_scattering = value;
                Notify("Max_scattering");
            }
        }

        public double Dopplershift
        {
            get { return dopplershift; }
            set
            {
                if (dopplershift == value) return;
                dopplershift = value;
                Notify("Dopplershift");
            }
        }

        public double Bandwidth
        {
            get { return bandwidth; }
            set
            {
                if (bandwidth == value) return;
                bandwidth = value;
                Notify("Bandwidth");
            }
        }

        public string Noisemod
        {
            get { return noisemod; }
            set
            {
                if (noisemod == value) return;
                noisemod = value;
                Notify("Noisemod");
            }
        }


        public double Threshold_Rx
        {
            get { return threshold_Rx; }
            set
            {
                if (threshold_Rx == value) return;
                threshold_Rx = value;
                Notify("Threshold_Rx");
            }
        }

        public Ray_tracing_parament(double power_Tx,double frequency_Tx,int max_reflection,int max_diffraction,int max_scattering,double dopplershift,double bandwidth, string noisemod,double threshold_Rx)
        {
            Power_Tx = power_Tx;
            Frequency_Tx = frequency_Tx;
            Max_reflection = max_reflection;
            Max_diffraction = max_diffraction;
            Max_scattering = max_scattering;
            Dopplershift = dopplershift;
            Bandwidth = bandwidth;
            Noisemod = noisemod;
            Threshold_Rx = threshold_Rx;
        }

    }
}
