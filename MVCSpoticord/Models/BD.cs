using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using MVCSpoticord.Models;

namespace MVCSpoticord.Models
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

        public static List<Usuario> ObtenerUsuarios()
        {
            List<Usuario> Usuarios = new List<Usuario>();
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "SELECT ID_Usuario, Nombre, Apellido, Username, Contraseña, Mail, Imagen, ID_Spotify FROM Usuario";
            consulta.CommandType = System.Data.CommandType.Text;
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                while (lector.Read())
                {
                    int ID = Convert.ToInt32(lector["ID_Usuario"]);
                    string Nombre = (lector["Nombre"]).ToString();
                    string Apellido = lector["Apellido"].ToString();
                    string Username = (lector["Username"]).ToString();
                    string Contraseña = (lector["Contraseña"]).ToString();
                    string Mail = (lector["Mail"]).ToString();
                    string Imagen = (lector["Imagen"]).ToString();
                    int ID_Spotify = 0; //Convert.ToInt32(lector["ID_Spotify"]);
                    Usuario unUsuario = new Usuario(ID,Nombre,Apellido,Username,Contraseña,Mail,Imagen,ID_Spotify);
                    Usuarios.Add(unUsuario);
                }
            }
            return Usuarios;
        }

        public static Usuario Login(string Username, string Contraseña)
        {
            Usuario unUsuario = null;
            string respuesta = null;
            if (Username != null && Contraseña != null)
            {
                SqlConnection conexion = Conectar();
                SqlCommand consulta = conexion.CreateCommand();
                consulta.CommandText = "sp_Login";
                consulta.CommandType = System.Data.CommandType.StoredProcedure;
                consulta.Parameters.AddWithValue("@Username", Username);
                consulta.Parameters.AddWithValue("@Contraseña", Contraseña);
                consulta.ExecuteNonQuery();
                SqlDataReader lector = consulta.ExecuteReader();
                if (lector.HasRows)
                {
                    lector.Read();
                    unUsuario = new Usuario();
                    unUsuario.ID = Convert.ToInt32(lector["ID_Usuario"]);
                    unUsuario.Nombre = (lector["Nombre"]).ToString();
                    unUsuario.Apellido = lector["Apellido"].ToString();
                    unUsuario.Username = (lector["Username"]).ToString();
                    unUsuario.Contraseña = (lector["Contraseña"]).ToString();
                    unUsuario.Mail = (lector["Mail"]).ToString();
                    unUsuario.Imagen = (lector["Imagen"]).ToString();
                    unUsuario.ID_Spotify = 0; //Convert.ToInt32(lector["ID_Spotify"]);
                }
                conexion.Close();
            }
            return unUsuario;
        }

        public static void RegistrarUsuario(string Nombre, string Apellido, string Username, string Contraseña, string Mail, string Imagen)
        {
            //string result = null;
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "sp_RegistrarUsuario";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@Nombre", Nombre);
            consulta.Parameters.AddWithValue("@Apellido", Apellido);
            consulta.Parameters.AddWithValue("@Username", Username);
            consulta.Parameters.AddWithValue("@Contraseña", Contraseña);
            consulta.Parameters.AddWithValue("@Mail", Mail);
            consulta.Parameters.AddWithValue("@Imagen", Imagen);
            consulta.ExecuteNonQuery();
            /*SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                result = lector.Read().ToString();
            }*/
            //return result;
        }

        public static string ModificarContraseña(int ID_Usuario, string contraseñaNueva, string contraseñaVieja)
        {
            string id = null;
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "sp_ModificarContraseña";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@ID_Usuario", ID_Usuario);
            consulta.Parameters.AddWithValue("@ContraseñaVieja", contraseñaVieja);
            consulta.Parameters.AddWithValue("@ContraseñaNueva", contraseñaNueva);
            consulta.ExecuteNonQuery();
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                lector.Read();
                id = (lector["ID_Usuario"]).ToString();
            }
            conexion.Close();
            return id;
        }

        public static string CrearGrupo(string Nombre, string Imagen)
        {
            string result = null;
            SqlConnection conexion = Conectar();
            SqlCommand consulta = conexion.CreateCommand();
            consulta.CommandText = "sp_CrearGrupo";
            consulta.CommandType = System.Data.CommandType.StoredProcedure;
            consulta.Parameters.AddWithValue("@Nombre", Nombre);
            consulta.Parameters.AddWithValue("@Imagen", Imagen);
            SqlDataReader lector = consulta.ExecuteReader();
            if (lector.HasRows)
            {
                result = lector.Read().ToString();
            }
            return result;
        }
    }
}