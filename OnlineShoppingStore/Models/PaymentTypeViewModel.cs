using System;
using System.Collections.Generic;


namespace OnlineShoppingStore.Models
{
    public class PaymentTypeViewModel
    {
        public PaymentTypeViewModel()
        {
            this.ShippingDetails = new HashSet<ShippingDetailViewModel>();
        }

        public int PaymentTypeId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public string PaymentTypeName { get; set; }

        public virtual ICollection<ShippingDetailViewModel> ShippingDetails { get; set; }
    }
}