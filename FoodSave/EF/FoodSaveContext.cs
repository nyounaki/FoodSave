using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using FoodSave.Models.Entities;
using Microsoft.EntityFrameworkCore.Storage;



namespace FoodSave.DAL.EF
{
    public class FoodSaveContext : DbContext
    {
        public FoodSaveContext() { }
        public FoodSaveContext(DbContextOptions options) : base(options) { }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured) { optionsBuilder.UseSqlServer(@"Server=DESKTOP-AUDQ5VS\SQLEXPRESS;Database=FoodStore;Trusted_Connection=True;MultipleActive ResultSets=true; ", options => options.EnableRetryOnFailure()); }
        }

        public DbSet<Customer> Customers
        {
            get; set;


        }
    }
}
