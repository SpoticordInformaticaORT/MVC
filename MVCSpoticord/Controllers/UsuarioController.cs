using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCSpoticord.Models;

namespace MVCSpoticord.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            List<Usuario> Usuarios = BD.ObtenerUsuarios();
            ViewBag.ListaDeUsuarios = Usuarios;
            return View();
        }

        [HttpPost]
        public ActionResult LoginEnBD(Usuario unUsuario)
        {
            Usuario user = BD.Login(unUsuario.Username, unUsuario.Contraseña);
            if (user != null)
            {
                Session["ID_Usuario"] = user.ID;
                Session["Nombre"] = user.Nombre;
                Session["Apellido"] = user.Apellido;
                Session["Username"] = user.Username;
                Session["Contraseña"] = user.Contraseña;
                Session["Mail"] = user.Mail;
                Session["Imagen"] = user.Imagen;
                Session["ID_Spotify"] = user.ID_Spotify;
                Session["Error"] = null;
                return RedirectToAction("PerfilUsuario");
            }
            else
            {
                Session["Error"] = true;
                return RedirectToAction("Login");
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarEnBD(Usuario unUsuario, HttpPostedFileBase Imagen)
        {
            if (Imagen != null && Imagen.ContentLength > 0)
            {
                string NuevaUbicacion = Server.MapPath("~/ImagenesUsuarios/") + Imagen.FileName;
                Imagen.SaveAs(NuevaUbicacion);
                unUsuario.Imagen = Imagen.FileName;
            }
            BD.RegistrarUsuario(unUsuario.Nombre, unUsuario.Apellido, unUsuario.Username, unUsuario.Contraseña, unUsuario.Mail, unUsuario.Imagen);
            return RedirectToAction("Index");
        }

        public ActionResult Registrar()
        {
            return View();
        }

        public ActionResult PerfilUsuario()
        {
            return View();
        }

        public ActionResult ModificarContraseña()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ModificarContraseñaEnBD(string contraseñaVieja, string contraseñaNueva)
        {
            string validacion;
            int id = Convert.ToInt32(Session["ID_Usuario"]);
            validacion = BD.ModificarContraseña(id, contraseñaVieja, contraseñaNueva);
            if (validacion == null)
            {
                return RedirectToAction("ModificarContraseña");
            }
            else
            {
                return RedirectToAction("PerfilUsuario");
            }
        }

        public ActionResult CerrarSesion()
        {
            Session["ID_Usuario"] = null;
            Session["Nombre"] = null;
            Session["Apellido"] = null;
            Session["Username"] = null;
            Session["Contraseña"] = null;
            Session["Mail"] = null;
            Session["Imagen"] = null;
            Session["ID_Spotify"] = null;
            Session["Error"] = null;
            return RedirectToAction("Login");
        }
    }
}