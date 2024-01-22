using ReviewApp.Models;
using System.Collections.Generic;

namespace ReviewApp.Interfaces
{
    public interface ICountryRepository
    {
        ICollection<Country> GetCountries();
        Country GetCountry(int id);
        Country GetCountryByOwner(int ownerId);
        ICollection<Owner> GetOwnersFromACountry(int countryId);
        bool CountryExists(int id);
        bool CreateCountry(Country country);
        bool Save();
        bool UpdateCountry(Country country);
        bool DeleteCountry(Country country);
    }
}