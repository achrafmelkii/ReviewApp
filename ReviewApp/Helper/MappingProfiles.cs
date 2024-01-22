using AutoMapper;
using ReviewApp.Dto;
using ReviewApp.Models;

namespace ReviewApp.Helper
{
    public class MappingProfiles : Profile
    {

        public MappingProfiles()
        {
            CreateMap<Pokemon, PokemonDto>();
            CreateMap<PokemonDto, Pokemon>();

            CreateMap<Category, CategoryDto>(); // dto must be first

            CreateMap<CategoryDto, Category>();

            CreateMap<Country, CountryDto>();
            CreateMap<CountryDto, Country>();
            CreateMap<OwnerDto, Owner>();


            
            CreateMap<ReviewDto, Review>();
            CreateMap<Review, ReviewDto>();

           
            
            CreateMap<Owner, OwnerDto>();

            
            
            CreateMap<Reviewer, ReviewerDto>();
            CreateMap<ReviewerDto, Reviewer>();   
        }
    }
}
