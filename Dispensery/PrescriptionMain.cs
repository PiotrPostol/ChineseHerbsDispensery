//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dispensery
{
    using System;
    using System.Collections.Generic;
    
    public partial class PrescriptionMain
    {
        public int FormulaID { get; set; }
        public string FormulaRefNum { get; set; }
        public string HerbRefNum { get; set; }
        public decimal HerbQuantity { get; set; }
        public string FormulaName { get; set; }
        public Nullable<int> DosageDays { get; set; }
        public Nullable<int> PatientID { get; set; }
        public Nullable<int> PractitionerID { get; set; }
        public Nullable<decimal> HerbRawToGranRatio { get; set; }
        public string HerbTemperature { get; set; }
        public Nullable<decimal> TotalHerbQuantity { get; set; }
        public string HerbBatchNum { get; set; }
        public string HerbChineseName { get; set; }
        public string HerbPharmName { get; set; }
        public Nullable<decimal> GranulesQuantity { get; set; }
        public Nullable<decimal> BuyPrice { get; set; }
        public Nullable<decimal> SellPrice { get; set; }
        public Nullable<decimal> Subtotal { get; set; }
        public Nullable<decimal> Procentage { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
    
        public virtual AllHerb AllHerb { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual Practitioner Practitioner { get; set; }
    }
}
