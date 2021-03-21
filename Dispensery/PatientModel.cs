using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dispensery
{
    public class PatientModel
    {
        public string InsertPatient(Patient patient)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                db.Patients.Add(patient);
                db.SaveChanges();

                return patient.PatientName +" " + patient.PatientSurname + " was succesfully inserted.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }

        }

        public string UpdatePatient(int patientId, Patient patient)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                //fetch object from db
                Patient p = db.Patients.Find(patientId);
                p.PatientName = patient.PatientName;
                p.PatientSurname = patient.PatientSurname;
                p.PatientAddress = patient.PatientAddress;
                p.PatientTown = patient.PatientTown;
                p.PatientCounty = patient.PatientCounty;
                p.PatientEirecode = patient.PatientEirecode;
                p.PatientPhoneNum = patient.PatientPhoneNum;
                p.PatientEmail = patient.PatientEmail;
                p.PatientMedication = patient.PatientMedication;
                p.PatientCountry = patient.PatientCountry;
                p.PatientMedicalCondition = patient.PatientMedicalCondition;


            
                db.SaveChanges();

                return patient.PatientName + " "+ patient.PatientSurname + " was succesfully updated.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }
        }

        public string DeletePatient(int patientId)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                Patient p = db.Patients.Find(patientId);
                db.Patients.Attach(p);
                db.Patients.Remove(p);
                db.SaveChanges();



                return p.PatientName + " " +p.PatientSurname + " was succesfully removed.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }
        }

        public Patient GetPatient(int patientId)
        {
            try
            {
                using (DispenseryEntities db = new DispenseryEntities())
                {
                    Patient p = db.Patients.Find(patientId);
                    return p;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }
        public List<Patient> GetAllPatients()
        {
            try
            {
                using(DispenseryEntities db = new DispenseryEntities())
                {
                    List<Patient> patients = (from x in db.Patients
                                              select x).ToList();
                    return patients;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}