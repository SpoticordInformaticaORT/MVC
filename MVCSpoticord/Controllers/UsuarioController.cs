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
            Session["Nombre"] = user.Nombre;
            Session["Apellido"] = user.Apellido;
            Session["Username"] = user.Username;
            Session["Contraseña"] = user.Contraseña;
            Session["Mail"] = user.Mail;
            Session["Imagen"] = user.Imagen;
            Session["ID_Spotify"] = user.ID_Spotify;
            ViewBag.Usuario = user;
            return RedirectToAction("PerfilUsuario");
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarEnBD(Usuario unUsuario)
        {
            BD.RegistrarUsuario(unUsuario.Nombre, unUsuario.Apellido, unUsuario.Username, unUsuario.Contraseña, unUsuario.Mail);
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
    }
}