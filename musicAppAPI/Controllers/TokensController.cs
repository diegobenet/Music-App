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

namespace musicAppAPI.Controllers
{
    public class TokensController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Tokens
        public IQueryable<Token> GetToken()
        {
            return db.Token;
        }

        // GET: api/Tokens/5
        [ResponseType(typeof(Token))]
        public IHttpActionResult GetToken(int id)
        {
            Token token = db.Token.Find(id);
            if (token == null)
            {
                return NotFound();
            }

            return Ok(token);
        }

        //get usuario by email or name & last name
        [ResponseType(typeof(Token))]
        public IHttpActionResult GetTokenByName(string Nombre)
        {
            Token token = db.Token.SingleOrDefault(t => t.Nombre == Nombre);

            if (token == null)
            {
                return NotFound();
            }
            DateTime dateToday = DateTime.Now;

            DateTime date = token.Fecha.AddDays(token.Expiracion);
            if (dateToday > date)
            {
                return Unauthorized();
            }
            return Ok(token);
        }

        // PUT: api/Tokens/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutToken(int id, Token token)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != token.Id_token)
            {
                return BadRequest();
            }

            db.Entry(token).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TokenExists(id))
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

        // POST: api/Tokens
        [ResponseType(typeof(Token))]
        public IHttpActionResult PostToken(Token token)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Token.Add(token);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = token.Id_token }, token);
        }

        // DELETE: api/Tokens/5
        [ResponseType(typeof(Token))]
        public IHttpActionResult DeleteToken(int id)
        {
            Token token = db.Token.Find(id);
            if (token == null)
            {
                return NotFound();
            }

            db.Token.Remove(token);
            db.SaveChanges();

            return Ok(token);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TokenExists(int id)
        {
            return db.Token.Count(e => e.Id_token == id) > 0;
        }
    }
}