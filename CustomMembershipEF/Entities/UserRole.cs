using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CustomMembershipEF.Entities
{
    public class UserRole
    {
        [Key]
        public int UserRoleId { get; set; }
        public int UserId { get; set; }
        public short RoleId { get; set; }

        public virtual Role Role { get; set; }
    }
}