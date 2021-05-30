using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace OnlineShoppingStore.Models
{
    public class Category
    {
        public Category()
        {
            this.Products = new HashSet<Product>();
        }
        public int CategoryId { get; set; }
        [Required(ErrorMessage = "Category Name Required")]
        [StringLength(500, ErrorMessage = "Minimum 3 and maximum 500 characters are allowed", MinimumLength = 3)]
        public string CategoryName { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }

        public virtual ICollection<Product> Products { get; set; }

        public override string ToString()
        {
            return CategoryId.ToString() + " " + CategoryName;
        }

    }
}