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
    public class FollowsController : ApiController
    {
        private musicAppDBEntities8 db = new musicAppDBEntities8();

        // GET: api/Follows
        public IQueryable<FollowDTO> GetFollow()
        {
            var result = db.Follow.Select(x => new FollowDTO()
            {
                id_follows = x.id_follows,
                Id_follower = x.Id_follower,
                Id_following = x.Id_following
            });

            return result;
            //return db.Follow;
        }

        // GET: api/Follows/5
        [ResponseType(typeof(Follow))]
        public IHttpActionResult GetFollow(int id)
        {
            Follow follow = db.Follow.Find(id);
            if (follow == null)
            {
                return NotFound();
            }

            return Ok(follow);
        }

        // PUT: api/Follows/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutFollow(int id, Follow follow)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != follow.id_follows)
            {
                return BadRequest();
            }

            db.Entry(follow).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FollowExists(id))
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

        // POST: api/Follows
        [ResponseType(typeof(Follow))]
        public IHttpActionResult PostFollow(Follow follow)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Follow.Add(follow);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = follow.id_follows }, follow);
        }

        // DELETE: api/Follows/5
        [ResponseType(typeof(Follow))]
        public IHttpActionResult DeleteFollow(int id_follower, int id_following)
        {
            Follow follow = db.Follow.FirstOrDefault(x => x.Id_follower == id_follower && x.Id_following == id_following);
            if (follow == null)
            {
                return NotFound();
            }

            db.Follow.Remove(follow);
            db.SaveChanges();

            return Ok(follow);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FollowExists(int id)
        {
            return db.Follow.Count(e => e.id_follows == id) > 0;
        }
    }
}