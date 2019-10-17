using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using AppDeMusica.Models;

namespace AppDeMusica.Models
{
    public class BD
    {
        private static string _connectionString = "Server=localhost; Database='AppDeMusica'; Trusted_Connection=True;";

        public static string ConnectionString
        {
            get
            {
                return _connectionString;
            }
        }

        private static SqlConnection Conectar()
        {
            SqlConnection conexion = new SqlConnection(_connectionString);
            conexion.Open();
            return conexion;
        }

        public static void Desconectar(SqlConnection conexion)
        {
            conexion.Close();
        }

        public static Usuario Login(string Username, string Contraseña)
        {
            Usuario unUsuario = null;
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "sp_Login";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@Username", Username);
            consulta.Parameters.AddWithValue("@Contraseña", Contraseña);
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                lector.Read();
                    string Nombre = (lector["Nombre"]).ToString();
                    string Apellido = lector["Apellido"].ToString();
                    string Usuario = (lector["Username"]).ToString();
                    string Contra = (lector["Contraseña"]).ToString();
                    string Direccion = (lector["Mail"]).ToString();
                    string Imagen = (lector["Imagen"]).ToString();
                    int ID_Spotify = Convert.ToInt32(lector["ID_Spotify"]);
                    Usuario usuario = new Usuario(Nombre, Apellido, Usuario, Contra, Direccion, Imagen, ID_Spotify);
            }
            conexion.Close();
            return unUsuario;
        }

        public static string RegistrarUsuario(string Nombre, string Apellido, string Username, string Contraseña, string Mail)
        {
            string result = null;
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "sp_RegistrarUsuario";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@Nombre", Nombre);
            consulta.Parameters.AddWithValue("@Apellido", Apellido);
            consulta.Parameters.AddWithValue("@Username", Username);
            consulta.Parameters.AddWithValue("@Contraseña", Contraseña);
            consulta.Parameters.AddWithValue("@Mail", Mail);
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                result = lector.Read().ToString();
            }
            return result;
        }
    }
}