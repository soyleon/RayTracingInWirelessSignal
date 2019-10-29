using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace I_RayTracer
{
    class Scene_paramenters:INotifyPropertyChanged
    {


        public string _Scene_object;
        public string _Material;
        public double _Conductivity;
        public double _Permitivity;
        public double[] _Location;

        public string Scene_object
        {
            get { return _Scene_object; }
            set { this._Scene_object = value; OnPropertyChanged("Scene_object"); }
        }
        public string Material
        {
            get { return _Material; }
            set { this._Material = value; OnPropertyChanged("Material"); }
        }

        public double Conductivity
        {
            get { return _Conductivity; }
            set { this._Conductivity = value; OnPropertyChanged("Conductivity"); }
        }

        public double Permitivity
        {
            get { return _Permitivity; }
            set { this._Permitivity = value; OnPropertyChanged("Permitivity"); }
        }

        public double[] Location
        {
            get { return _Location; }
            set { this._Location = value; OnPropertyChanged("Location"); }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        void OnPropertyChanged(string name)
        {
            if (PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
        }  

    }
}
