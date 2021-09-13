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
    public class PostsController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Posts
        public IQueryable<PostDTO> GetPost()
        {
            var result = db.Post.Select(x => new PostDTO()
            {
                Id_post = x.Id_post,
                Id_usuario = x.Id_usuario,
                Id_agrupacion = x.Id_agrupacion,
                Archivo_mp3 = x.Archivo_mp3,
                Comentario = x.Comentario,
                Like = x.Like,
                Mensaje = x.Mensaje,
                Fecha_creacion = x.Fecha_creacion
            });

            return result;
            //return db.Post;
        }

        // GET: api/Posts/5
        [ResponseType(typeof(PostDTO))]
        public IHttpActionResult GetPost(int id)
        {
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return NotFound();
            }

            PostDTO pDTO = new PostDTO
            {
                Id_post = post.Id_post,
                Id_usuario = post.Id_usuario,
                Id_agrupacion = post.Id_agrupacion,
                Archivo_mp3 = post.Archivo_mp3,
                Comentario = post.Comentario,
                Like = post.Like,
                Mensaje = post.Mensaje,
                Fecha_creacion = post.Fecha_creacion

            };

            return Ok(pDTO);
        }

        // GET: api/Posts?Usuario=5
        [ResponseType(typeof(Post))]
        public IHttpActionResult GetPostByUser(int user)
        {
            var result = db.Post.Where(x => x.Id_usuario == user);

            if (result == null)
            {
                return NotFound();
            }

            return Ok(result);
        }

        // PUT: api/Posts/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPost(int id, Post post)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != post.Id_post)
            {
                return BadRequest();
            }

            db.Entry(post).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PostExists(id))
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

        // POST: api/Posts
        [ResponseType(typeof(Post))]
        public IHttpActionResult PostPost(Post post)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Post.Add(post);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = post.Id_post }, post);
        }

        // DELETE: api/Posts/5
        [ResponseType(typeof(Post))]
        public IHttpActionResult DeletePost(int id)
        {
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return NotFound();
            }

            db.Post.Remove(post);
            db.SaveChanges();

            return Ok(post);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PostExists(int id)
        {
            return db.Post.Count(e => e.Id_post == id) > 0;
        }
    }
}