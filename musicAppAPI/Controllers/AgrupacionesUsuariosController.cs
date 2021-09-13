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
    public class AgrupacionesUsuariosController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/AgrupacionesUsuarios
        public IQueryable<AgrupacionesUsuarios> GetAgrupacionesUsuarios()
        {
            return db.AgrupacionesUsuarios;
        }

        // GET: api/AgrupacionesUsuarios/5
        [ResponseType(typeof(AgrupacionesUsuarios))]
        public IHttpActionResult GetAgrupacionesUsuarios(int id)
        {
            AgrupacionesUsuarios agrupacionesUsuarios = db.AgrupacionesUsuarios.Find(id);
            if (agrupacionesUsuarios == null)
            {
                return NotFound();
            }

            return Ok(agrupacionesUsuarios);
        }

        // PUT: api/AgrupacionesUsuarios/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAgrupacionesUsuarios(int id, AgrupacionesUsuarios agrupacionesUsuarios)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != agrupacionesUsuarios.Id_agrupacionesUsuarios)
            {
                return BadRequest();
            }

            db.Entry(agrupacionesUsuarios).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AgrupacionesUsuariosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/AgrupacionesUsuarios
        [ResponseType(typeof(AgrupacionesUsuariosDTO))]
        public IHttpActionResult PostAgrupacionesUsuarios(AgrupacionesUsuariosDTO auDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            AgrupacionesUsuarios agrupacionesUsuarios = new AgrupacionesUsuarios
            {
                Id_usuario = auDTO.Id_usuario,
                Id_agrupacion = auDTO.Id_agrupacion
            };

            db.AgrupacionesUsuarios.Add(agrupacionesUsuarios);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = agrupacionesUsuarios.Id_agrupacionesUsuarios }, agrupacionesUsuarios);
        }

        // DELETE: api/AgrupacionesUsuarios/5
        [ResponseType(typeof(AgrupacionesUsuarios))]
        public IHttpActionResult DeleteAgrupacionesUsuarios(int id)
        {
            AgrupacionesUsuarios agrupacionesUsuarios = db.AgrupacionesUsuarios.Find(id);
            if (agrupacionesUsuarios == null)
            {
                return NotFound();
            }

            db.AgrupacionesUsuarios.Remove(agrupacionesUsuarios);
            db.SaveChanges();

            return Ok(agrupacionesUsuarios);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AgrupacionesUsuariosExists(int id)
        {
            return db.AgrupacionesUsuarios.Count(e => e.Id_agrupacionesUsuarios == id) > 0;
        }
    }
}