using System;
using System.Collections.Generic;


namespace OnlineShoppingStore.Models
{
    public class Member
    {
        public Member()
        {
            this.ShippingDetails = new HashSet<ShippingDetail>();
        }

        public int MemberId { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public bool IsDelete { get; set; }

        public virtual ICollection<ShippingDetail> ShippingDetails { get; set; }
    }
}