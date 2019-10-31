using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCSpoticord.Models
{
    public class CambioContraseña
    {
        private string _contraseñaVieja;
        private string _contraseñaNueva;

        public string contraseñaVieja
        {
            get
            {
                return _contraseñaVieja;
            }
            set
            {
                _contraseñaVieja = value;
            }
        }
        public string contraseñaNueva
        {
            get
            {
                return _contraseñaNueva;
            }
            set
            {
                _contraseñaNueva = value;
            }
        }
    }
}