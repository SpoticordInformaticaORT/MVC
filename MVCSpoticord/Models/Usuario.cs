using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppDeMusica.Models;

namespace AppDeMusica.Models
{
    public class Usuario
    {
        private string _nombre;
        private string _apellido;
        private string _username;
        private string _contraseña;
        private string _mail;
        private string _imagen;
        private int _idSpotify;

        public Usuario(string nombre, string apellido, string username, string contraseña, string mail, string imagen, int ID_Spotify)
        {
            _nombre = nombre;
            _apellido = apellido;
            _username = username;
            _contraseña = contraseña;
            _mail = mail;
            _imagen = imagen;
            _idSpotify = ID_Spotify;
        }

        public Usuario()
        {

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
        public string Apellido
        {
            get
            {
                return _apellido;
            }
            set
            {
                _apellido = value;
            }
        }
        public string Username
        {
            get
            {
                return _username;
            }
            set
            {
                _username = value;
            }
        }
        public string Contraseña
        {
            get
            {
                return _contraseña;
            }
            set
            {
                _contraseña = value;
            }
        }
        public string Mail
        {
            get
            {
                return _mail;
            }
            set
            {
                _mail = value;
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
        public int ID_Spotify
        {
            get
            {
                return _idSpotify;
            }
            set
            {
                _idSpotify = value;
            }
        }
    }
}