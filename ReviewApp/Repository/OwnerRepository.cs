using ReviewApp.Data;
using ReviewApp.Interface;
using ReviewApp.Models;
using System.Collections.Generic;
using System.Linq;

namespace ReviewApp.Repository
{
    public class OwnerRepository : IOwnerRepository
    {

        private DataContext _context;
        public OwnerRepository(DataContext context)
        {
            _context = context;      
        }
        public Owner GetOwner(int ownerId)
        {
            return _context.Owners.Where(o=> o.id == ownerId).FirstOrDefault();
        }

        public ICollection<Owner> GetOwnerOfAPokemon(int pokeId)
        {
           return _context.PokemonOwners.Where(po=> po.PokemonId == pokeId).Select(p=>p.Owner).tol();
       
        }

        public ICollection<Owner> GetOwners()
        {
            return _context.Owners.ToList();
        }

        public ICollection<Pokemon> GetPokemonByOwner(int ownerId)
        {
return _context.PokemonOwners.Where(po =>po.OwnerId == ownerId).Select(p => p.Pokemon).ToList();    
        }

        public bool OwnerExists(int ownerId)
        {
           return _context.Owners.Any(o => o.Id == ownerId);
        }
    }
}
