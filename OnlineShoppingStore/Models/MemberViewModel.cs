using System;
using System.Collections.Generic;


namespace OnlineShoppingStore.Models
{
    public class MemberViewModel
    {
        public MemberViewModel()
        {
            this.ShippingDetails = new HashSet<ShippingDetailViewModel>();
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

        public virtual ICollection<ShippingDetailViewModel> ShippingDetails { get; set; }
    }
}