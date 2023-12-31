﻿using Microsoft.EntityFrameworkCore;
using ReviewApp.Data;
using ReviewApp.Interface;
using ReviewApp.Models;
using System.Collections.Generic;
using System.Linq;

namespace ReviewApp.Repository
{

    public class ReviewRepository : IReviewRepository
    {
    private DataContext _context;
        public ReviewRepository(DataContext context)
        {
            _context = context;
        }

        public bool CreateReview( Review review)
        {
            _context.Add(review);
            return Save();
        }

        public Review GetReview(int reviewId)
        {
            return _context.Reviews.Where(r=> r.Id == reviewId).FirstOrDefault();
        }

        public ICollection<Review> GetReviews()
        {
           return _context.Reviews.ToList();  
        }

        public ICollection<Review> GetReviewsOfAPokemon(int pokeId)
        {
           return _context.Reviews.Where(p=>p.Pokemon.Id == pokeId).ToList();
        }

        public bool ReviewExists(int reviewId)
        {
           return _context.Reviews.Any(r=> r.Id == reviewId);
        }

        public bool Save()
        {
            var saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }
    }
}
