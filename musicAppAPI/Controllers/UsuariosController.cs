using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using musicAppAPI.Models;
using musicAppAPI.Models.DTO;

namespace musicAppAPI.Controllers
{
    public class UsuariosController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Usuarios
        public IQueryable<UsuarioDTO> GetUsuario()
        {
            var result = db.Usuario.Select(x => new UsuarioDTO()
            {
                Id_usuario = x.Id_usuario,
                Email = x.Email,
                Nombre = x.Nombre,
                Apellidos = x.Apellidos,
                Contraseña = x.Contraseña,
                Fecha_nac = x.Fecha_nac,
                Ciudad = x.Ciudad,
                Genero = x.Genero,
                Foto_perfil = x.Foto_perfil
            });

            return result;
            //return db.Usuario;
        }

        // GET: api/Usuarios
        public IQueryable<UsuarioDTO> GetUsuario(string filtro)
        {
            var result = db.Usuario.Where(x => x.Nombre.Contains(filtro) || x.Apellidos.Contains(filtro)).Select(x =>  new UsuarioDTO()
            {
                Id_usuario = x.Id_usuario,
                Email = x.Email,
                Nombre = x.Nombre,
                Apellidos = x.Apellidos,
                Contraseña = x.Contraseña,
                Fecha_nac = x.Fecha_nac,
                Ciudad = x.Ciudad,
                Genero = x.Genero,
                Foto_perfil = x.Foto_perfil
            });

            return result;
            //return db.Usuario;
        }

        // GET: api/Usuarios/5
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult GetUsuario(int id)
        {
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            return Ok(usuario);
        }

        //get usuario by email or name & last name
        [ResponseType(typeof(UsuarioDTO))]
        public IHttpActionResult GetUsuarioByEmailOrName(string usr)
        {
            Usuario usuario = db.Usuario.SingleOrDefault(user => user.Email == usr);

            if (usuario == null)
            {
                var name = usr;
                var Nombre = "";
                var Apellidos = "";
                try
                {
                    var firstSpaceIndex = name.IndexOf(" ");
                    Nombre = name.Substring(0, firstSpaceIndex);
                    Apellidos = name.Substring(firstSpaceIndex + 1);

                    usuario = db.Usuario.SingleOrDefault(user => user.Nombre == Nombre && user.Apellidos == Apellidos);
                }
                catch (Exception e)
                {
                    return NotFound();
                }

                if (usuario == null)
                {
                    return NotFound();
                }
                else
                {
                    UsuarioDTO uDTO = new UsuarioDTO
                    {
                        Id_usuario = usuario.Id_usuario,
                        Email = usuario.Email,
                        Nombre = usuario.Nombre,
                        Apellidos = usuario.Apellidos,
                        Contraseña = usuario.Contraseña

                    };
                    return Ok(uDTO);
                }
            }
            else
            {
                UsuarioDTO uDTO = new UsuarioDTO
                {
                    Id_usuario = usuario.Id_usuario,
                    Email = usuario.Email,
                    Nombre = usuario.Nombre,
                    Apellidos = usuario.Apellidos,
                    Contraseña = usuario.Contraseña

                };
                return Ok(uDTO);
            }
        }
        // PUT: api/Usuarios/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUsuario(int id, Usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuario.Id_usuario)
            {
                return BadRequest();
            }
            Usuario usuario2 = db.Usuario.Find(id);

            usuario2.Email = usuario.Email;
            usuario2.Ciudad = usuario.Ciudad;
            usuario2.Instrumentos_fav = usuario.Instrumentos_fav;
            usuario2.Genero_musical_fav = usuario.Genero_musical_fav;
            usuario2.Es_cantante = usuario.Es_cantante;
            usuario2.Estado_en_banda_concierto = usuario.Estado_en_banda_concierto;
            usuario2.Desc_personal = usuario.Desc_personal;
            usuario2.Foto_perfil = usuario.Foto_perfil;

            db.Entry(usuario2).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
                return Ok();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsuarioExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        // POST: api/Usuarios
        [ResponseType(typeof(UsuarioDTO))]
        public IHttpActionResult PostUsuario(UsuarioDTO uDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (uDTO.Contraseña != uDTO.verifContra) return BadRequest();

            Usuario usuario = new Usuario
            {
                Email = uDTO.Email,
                Nombre = uDTO.Nombre,
                Apellidos = uDTO.Apellidos,
                Contraseña = uDTO.Contraseña,
                Fecha_nac = uDTO.Fecha_nac,
                Ciudad = uDTO.Ciudad,
                Genero = uDTO.Genero,
                Foto_perfil = uDTO.Foto_perfil
            };

            db.Usuario.Add(usuario);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = usuario.Id_usuario }, usuario);
        }

        // DELETE: api/Usuarios/5
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult DeleteUsuario(int id)
        {
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            db.Usuario.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UsuarioExists(int id)
        {
            return db.Usuario.Count(e => e.Id_usuario == id) > 0;
        }
    }
}