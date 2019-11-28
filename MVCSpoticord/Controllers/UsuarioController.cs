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
            if (Session["ID_Usuario"] == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("PerfilUsuario");
            }
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
            Usuario user = BD.ObtenerUnUsuario(unUsuario.Username);
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

        public ActionResult Registrar()
        {
            if (Session["ID_Usuario"] == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("PerfilUsuario");
            }
        }

        public ActionResult PerfilUsuario()
        {
            if (Session["ID_Usuario"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                List<Grupo> misGrupos = BD.ObtenerMisGrupos(Convert.ToInt32(Session["ID_Usuario"]));
                ViewBag.misGrupos = misGrupos;
                return View();
            }
        }

        public ActionResult ModificarContraseña()
        {
            if (Session["ID_Usuario"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                return View();
            }
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

        public ActionResult CrearGrupo()
        {
            if (Session["ID_Usuario"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult CrearGrupoEnBD(Grupo unGrupo, HttpPostedFileBase Imagen)
        {
            int resultado;
            if (Imagen != null && Imagen.ContentLength > 0)
            {
                string NuevaUbicacion = Server.MapPath("~/ImagenesGrupos/") + Imagen.FileName;
                Imagen.SaveAs(NuevaUbicacion);
                unGrupo.Imagen = Imagen.FileName;
            }
            resultado = BD.CrearGrupo(unGrupo.Nombre, unGrupo.Imagen);
            if (resultado != 0)
            {
                BD.AñadirIntegranteDeGrupo(resultado, Convert.ToInt32(Session["ID_Usuario"]));
                return RedirectToAction("PerfilUsuario");
            }
            else
            {
                return RedirectToAction("CrearGrupo");
            }
        }

        public ActionResult PerfilGrupo()
        {
            if (Session["ID_Usuario"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                List<Usuario> integrantes = BD.ObtenerLosIntegrantes(Convert.ToInt32(Session["ID_Grupo"]));
                ViewBag.Integrantes = integrantes;
                Grupo grupo = BD.ObtenerUnGrupo(Convert.ToInt32(Session["ID_Grupo"]));
                Session["ID_Grupo"] = grupo.ID;
                return View(grupo);
            }
        }

        public ActionResult ID_Grupo(int id)
        {
            Session["ID_Grupo"] = id;
            return RedirectToAction("PerfilGrupo");
        }

        public ActionResult AñadirIntegrante()
        {
            if (Session["ID_Usuario"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                return View();
            }
        }

        public ActionResult AñadirIntegranteEnBD(Usuario usuario)
        {
            int idGrupo = Convert.ToInt32(Session["ID_Grupo"]);
            Usuario user = BD.ObtenerUnUsuario(usuario.Username);
            if (user == null)
            {
                Session["UsuarioInexistente"] = true;
                return RedirectToAction("AñadirIntegrante");
            }
            else
            {
                BD.AñadirIntegranteDeGrupo(idGrupo, user.ID);
                return RedirectToAction("PerfilGrupo");
            }
        }

        public ActionResult EliminarIntegrante(int id)
        {
            BD.EliminarIntegranteDeGrupo(Convert.ToInt32(Session["ID_Grupo"]), id);
            return RedirectToAction("PerfilGrupo");
        }

        public ActionResult EliminarGrupo(int id)
        {
            BD.EliminarGrupo(id);
            return RedirectToAction("PerfilUsuario");
        }
    }
}