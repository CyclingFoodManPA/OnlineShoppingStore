using System;
using System.Collections.Generic;


namespace OnlineShoppingStore.Models
{
    public class PaymentType
    {
        public PaymentType()
        {
            this.ShippingDetails = new HashSet<ShippingDetail>();
        }

        public int PaymentTypeId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public string PaymentTypeName { get; set; }

        public virtual ICollection<ShippingDetail> ShippingDetails { get; set; }
    }
}