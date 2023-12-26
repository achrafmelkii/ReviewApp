using ReviewApp.Models;
using System.Collections.Generic;

namespace ReviewApp.Dto
{
    public class ReviewerDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        //public ICollection<Review> Reviews { get; set; } //list that cant be edited

    }
}