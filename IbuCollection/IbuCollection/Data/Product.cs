//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IbuCollection.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ProductCategoryId { get; set; }
        public string Description { get; set; }
        public string Code { get; set; }
        public string SupplierName { get; set; }
        public Nullable<System.DateTime> DtCreated { get; set; }
        public Nullable<long> CreatedById { get; set; }
        public string ExtraInfo { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual ProductCategory ProductCategory { get; set; }
    }
}