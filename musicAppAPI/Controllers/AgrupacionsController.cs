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
    public class AgrupacionsController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Agrupacions
        public IQueryable<Agrupacion> GetAgrupacion()
        {
            return db.Agrupacion;
        }

        public IQueryable<Agrupacion> GetLastAgrupacion()
        {
            int max = db.Agrupacion.Max(p => p.Id_agrupacion);
            return db.Agrupacion;
        }

        // GET: api/Agrupacions/5
        [ResponseType(typeof(Agrupacion))]
        public IHttpActionResult GetAgrupacion(int id)
        {
            Agrupacion agrupacion = db.Agrupacion.Find(id);
            if (agrupacion == null)
            {
                return NotFound();
            }

            return Ok(agrupacion);
        }

        // PUT: api/Agrupacions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAgrupacion(int id, Agrupacion agrupacion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != agrupacion.Id_agrupacion)
            {
                return BadRequest();
            }

            db.Entry(agrupacion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AgrupacionExists(id))
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

        // POST: api/Agrupacions
        [ResponseType(typeof(AgrupacionDTO))]
        public IHttpActionResult PostAgrupacion(AgrupacionDTO aDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Agrupacion agrupacion = new Agrupacion
            {
                Nombre = aDTO.Nombre,
                Ciudad = aDTO.Ciudad,
                Genero_musical = aDTO.Genero_musical,
                Foto = aDTO.Foto,
                Busca_integrantes = aDTO.Busca_integrantes
            };

            db.Agrupacion.Add(agrupacion);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = agrupacion.Id_agrupacion }, agrupacion);
        }

        // DELETE: api/Agrupacions/5
        [ResponseType(typeof(Agrupacion))]
        public IHttpActionResult DeleteAgrupacion(int id)
        {
            Agrupacion agrupacion = db.Agrupacion.Find(id);
            if (agrupacion == null)
            {
                return NotFound();
            }

            db.Agrupacion.Remove(agrupacion);
            db.SaveChanges();

            return Ok(agrupacion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AgrupacionExists(int id)
        {
            return db.Agrupacion.Count(e => e.Id_agrupacion == id) > 0;
        }
    }
}