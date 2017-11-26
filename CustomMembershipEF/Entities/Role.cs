using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CustomMembershipEF.Entities
{
    public class Role
    {
        [Key]
        public short RoleId { get; set; }
        public string RoleName { get; set; }
        public string RoleDescription { get; set; }
    }
}