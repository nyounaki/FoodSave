using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace FoodSave.Models.Entities
{
    [Table("Customer", Schema = "sa")]
    public class Customer
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerID { get; set; }
        [DataType(DataType.Text), MaxLength(50)]
        public string FName { get; set; }
        [DataType(DataType.Text), MaxLength(50)]
        public string LName { get; set; }
        [DataType(DataType.Text), MaxLength(50)]
        public string Phone { get; set; }
        [DataType(DataType.Text), MaxLength(250)]
        public string Address { get; set; }
        [DataType(DataType.Text), MaxLength(50)]
        public string City { get; set; }
        [ForeignKey("Country")]
        public string CountryID { get; set; }
        [DataType(DataType.Text), MaxLength(50)]
        public string PostalCode { get; set; }
        [DataType(DataType.Text), MaxLength(250)]
        public string Email { get; set; }
        [ForeignKey("Province")]
        public string ProvinceID { get; set; }


    }
}
