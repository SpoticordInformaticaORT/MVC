using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppDeMusica.Models;

namespace AppDeMusica.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginEnBD(Usuario unUsuario)
        {
            BD.Login(unUsuario.Username, unUsuario.Contraseña);
            return RedirectToAction("Login");
        }

        public ActionResult Login()
        {
            return View();
        }
    }
}