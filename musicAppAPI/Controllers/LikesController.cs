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
    public class LikesController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Likes
        public IQueryable<LikeDTO> GetLike()
        {
            var result = db.Like.Select(x => new LikeDTO()
            {
                Id_like = x.Id_like,
                Id_post = x.Id_post,
                Id_usuario = x.Id_usuario
            });

            return result;
            //return db.Like;
        }

        // GET: api/Likes/5
        [ResponseType(typeof(Like))]
        public IHttpActionResult GetLike(int id)
        {
            Like like = db.Like.Find(id);
            if (like == null)
            {
                return NotFound();
            }

            return Ok(like);
        }

        // PUT: api/Likes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLike(int id, Like like)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != like.Id_like)
            {
                return BadRequest();
            }

            db.Entry(like).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LikeExists(id))
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

        // POST: api/Likes
        [ResponseType(typeof(Like))]
        public IHttpActionResult PostLike(Like like)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Like.Add(like);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = like.Id_like }, like);
        }

        // DELETE: api/Likes/5
        [ResponseType(typeof(Like))]
        public IHttpActionResult DeleteLike(int id_usuario, int id_post)
        {
            Like like =  db.Like.FirstOrDefault(x => x.Id_usuario == id_usuario && x.Id_post == id_post);
            if (like == null)
            {
                return NotFound();
            }

            db.Like.Remove(like);
            db.SaveChanges();

            return Ok(like);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LikeExists(int id)
        {
            return db.Like.Count(e => e.Id_like == id) > 0;
        }
    }
}