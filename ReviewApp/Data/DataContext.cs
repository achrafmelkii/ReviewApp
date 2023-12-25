using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ReviewApp.Models;

namespace ReviewApp.Data
{
    public class DataContext : DbContext  // enherit fromDbContext 
    {

        //data context
        public DataContext(DbContextOptions<DataContext> options) : base (options) //bush data into DbContext
        {

        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Owner> Owners { get; set; }
        public DbSet<Pokemon> Pokemons { get; set; }
        public DbSet<PokemonCategory> PokemonCategories { get; set; }
        public DbSet<PokemonOwner> PokemonOwners { get; set; }

        public DbSet<Review > Reviews { get; set; }
        public DbSet<Reviewer> Reviewers { get; set; }

        //many to many relationships
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PokemonCategory>()
                    .HasKey(pc => new { pc.PokemonId, pc.CategoryId }); //link those 2 ids

            modelBuilder.Entity<PokemonCategory>()
                    .HasOne(p => p.Pokemon)
                    .WithMany(pc => pc.PokemonCategories)
                    .HasForeignKey(p => p.PokemonId); //

            modelBuilder.Entity<PokemonCategory>()
                    .HasOne(p => p.Category)
                    .WithMany(pc => pc.PokemonCategories)
                    .HasForeignKey(p => p.CategoryId); //


            //pokemonowner
            modelBuilder.Entity<PokemonOwner>()
           .HasKey(po => new { po.PokemonId, po.OwnerId }); //link those 2 ids

            modelBuilder.Entity<PokemonOwner>()
                    .HasOne(p => p.Pokemon)
                    .WithMany(po => po.PokemonOwners)
                    .HasForeignKey(p => p.PokemonId); //

            modelBuilder.Entity<PokemonOwner>()
                    .HasOne(p => p.Owner)  //type owner
                    .WithMany(po => po.PokemonOwners)// list of DbSet<PokemonOwner> PokemonOwners
                    .HasForeignKey(p => p.OwnerId); //owners id


        }



    }
}
