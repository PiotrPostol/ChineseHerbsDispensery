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
    
    public partial class Patient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Patient()
        {
            this.PrescriptionMainTemps = new HashSet<PrescriptionMainTemp>();
            this.PrescriptionMains = new HashSet<PrescriptionMain>();
        }
    
        public int PatientID { get; set; }
        public string PatientName { get; set; }
        public string PatientSurname { get; set; }
        public string PatientAddress { get; set; }
        public string PatientTown { get; set; }
        public string PatientCounty { get; set; }
        public string PatientEirecode { get; set; }
        public string PatientPhoneNum { get; set; }
        public string PatientEmail { get; set; }
        public string PatientMedication { get; set; }
        public string PatientCountry { get; set; }
        public string PatientMedicalCondition { get; set; }
        public Nullable<System.DateTime> DateAdded { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PrescriptionMainTemp> PrescriptionMainTemps { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PrescriptionMain> PrescriptionMains { get; set; }
    }
}
