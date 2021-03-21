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
    
    public partial class Practitioner
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Practitioner()
        {
            this.PatentFormulaSaleHistories = new HashSet<PatentFormulaSaleHistory>();
            this.PrescriptionMainTemps = new HashSet<PrescriptionMainTemp>();
            this.PrescriptionMains = new HashSet<PrescriptionMain>();
        }
    
        public int PractitionerID { get; set; }
        public string PracName { get; set; }
        public string PracSurname { get; set; }
        public string PracAddress { get; set; }
        public string PracEmail { get; set; }
        public string PracTellphoneNum { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatentFormulaSaleHistory> PatentFormulaSaleHistories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PrescriptionMainTemp> PrescriptionMainTemps { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PrescriptionMain> PrescriptionMains { get; set; }
    }
}
