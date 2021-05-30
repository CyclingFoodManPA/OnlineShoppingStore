using System;
using System.ComponentModel.DataAnnotations;


namespace OnlineShoppingStore.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }

        [Required(ErrorMessage = "Product Name Required")]
        [StringLength(50, ErrorMessage = "Minimum 3 and maximum 50 characters are allowed", MinimumLength = 3)]
        public string ProductName { get; set; }

        public int CategoryId { get; set; }

        public bool IsActive { get; set; }

        public bool IsDelete { get; set; }


        [StringLength(500, ErrorMessage = "Maximum 500 characters are allowed", MinimumLength = 0)]
        public string Description { get; set; }

        public string ProductImage { get; set; }

        public bool IsFeatured { get; set; }

        [Required]
        [Range(typeof(int), "1", "500", ErrorMessage = "Invalid Quantity")]
        public int Quantity { get; set; }

        [Required]
        [Range(typeof(decimal), "1", "200000", ErrorMessage = "invalid Price")]
        public decimal Price { get; set; }

        public virtual Category Category { get; set; }

        public override string ToString()
        {
            return ProductId.ToString() + " " + ProductName;
        }
    }
}