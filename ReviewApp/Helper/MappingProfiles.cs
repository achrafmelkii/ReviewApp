﻿using AutoMapper;
using ReviewApp.Dto;
using ReviewApp.Models;

namespace ReviewApp.Helper
{
    public class MappingProfiles : Profile
    {

        public MappingProfiles()
        {
            CreateMap<Pokemon, PokemonDto>();


            CreateMap<Category, CategoryDto>();
            CreateMap<CategoryDto, Category>();

            CreateMap<CountryDto, Country>();
            CreateMap<OwnerDto, Owner>();


            CreateMap<PokemonDto, Pokemon>();
            CreateMap<ReviewDto, Review>();


            CreateMap<Country, CountryDto>();
            
            CreateMap<Owner, OwnerDto>();

            CreateMap<Review, ReviewDto>();
            
            CreateMap<Reviewer, ReviewerDto>();
            CreateMap<ReviewerDto, Reviewer>();   
        }
    }
}
