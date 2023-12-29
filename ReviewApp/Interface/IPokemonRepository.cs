using ReviewApp.Models;
using System.Collections;
using System.Collections.Generic;

namespace ReviewApp.Interface
{
    public interface IPokemonRepository
    {
        ICollection<Pokemon> GetPokemons();

        Pokemon GetPokemon(int id);

        Pokemon GetPokemon(string name);

        decimal GetPokemonRating(int pokeId);

        bool    PokemonExists (int pokeid);

        bool CreatePokemon(int ownerId, int categoryId, Pokemon pokemon);
        bool Save();

    }
}
