using Microsoft.EntityFrameworkCore;
using ReviewApp.Data;
using ReviewApp.Interface;
using ReviewApp.Models;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace ReviewApp.Repository
{

    public class PokemonRepository : IPokemonRepository


    {
        //attributes
        private readonly DataContext _context;


        //methods
        public PokemonRepository(DataContext context)//constructor
        {
            _context = context;
        }

        public Pokemon GetPokemon(int id)
        {
            return _context.Pokemons.Where(p => p.Id == id).FirstOrDefault(); //return only one result with the "where" filter

        }

        public Pokemon GetPokemon(string name)
        {
            return _context.Pokemons.Where(p => p.Name == name).FirstOrDefault();
        }

    public decimal GetPokemonRating(int pokeId)
        {
            var review = _context.Reviews.Where(p => p.Pokemon.Id == pokeId);

            if (review.Count() <= 0)
                return 0;

            return ((decimal)review.Sum(r => r.Rating) / review.Count());
        }

        public ICollection<Pokemon> GetPokemons()
        {
            return _context.Pokemons.OrderBy(p => p.Id).ToList();//return a list ogf results with the "orderby" filter

        }


        public bool PokemonExists(int pokeid)
        {
            return _context.Pokemons.Any(p => p.Id == pokeid);
        }
    }
}
