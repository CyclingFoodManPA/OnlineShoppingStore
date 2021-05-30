using System;
using System.ComponentModel.DataAnnotations;


namespace OnlineShoppingStore.Models
{
    public class ShippingDetailViewModel
    {
        public int ShippingDetailId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }

        [Required]
        public int MemberId { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string Country { get; set; }
        [Required]
        public string ZipCode { get; set; }
        public Nullable<int> OrderId { get; set; }
        public decimal AmountPaid { get; set; }
        [Required]
        public string PaymentTypeId { get; set; }

        public virtual MemberViewModel Member { get; set; }

        public virtual PaymentTypeViewModel PaymentType { get; set; }
    }
}