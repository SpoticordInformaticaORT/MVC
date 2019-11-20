using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCSpoticord.Models
{
    public class Grupo
    {
        private int _id;
        private string _nombre;
        private string _imagen;

        public Grupo(int id, string nombre, string imagen)
        {
            _id = id;
            _nombre = nombre;
            _imagen = imagen;
        }

        public Grupo()
        {

        }

        public int ID
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }
        public string Nombre
        {
            get
            {
                return _nombre;
            }
            set
            {
                _nombre = value;
            }
        }
        public string Imagen
        {
            get
            {
                return _imagen;
            }
            set
            {
                _imagen = value;
            }
        }
    }
}