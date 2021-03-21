using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dispensery
{
    public class HerbStockModel
    {
        public string InsertPatient(HerbStock herbStock)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                db.HerbStocks.Add(herbStock);
                db.SaveChanges();

                return "Herb ref.: " +herbStock.HerbRefNum + ", batch : "+ herbStock.BatchNum + " was succesfully inserted.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }

        }

        public string UpdateHerbStock(int herbStockID, HerbStock herbStock)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                //fetch object from db
                HerbStock hs = db.HerbStocks.Find(herbStockID);
                hs.HerbRefNum = herbStock.HerbRefNum;
                hs.BatchNum = herbStock.BatchNum;
                hs.BuyPrice = herbStock.BuyPrice;
                hs.ExpiryDate = herbStock.ExpiryDate;
                hs.Quantity = herbStock.Quantity;
                hs.SupplierID = herbStock.SupplierID;
                hs.HerbRawToGranRatio = herbStock.HerbRawToGranRatio;
                hs.DateReceived = herbStock.DateReceived;
                hs.DateToDispensery = herbStock.DateToDispensery;
                hs.HerbForm = herbStock.HerbForm;
                hs.DateLastChanged = herbStock.DateLastChanged;



                db.SaveChanges();

                return "Herb ref.: " + herbStock.HerbRefNum + ", batch : " + herbStock.BatchNum + " was succesfully inserted.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }
        }

        //public string DeletePatient(int patientId)
        //{
        //    try
        //    {
        //        DispenseryEntities db = new DispenseryEntities();
        //        HerbStock hs = db.Patients.Find(patientId);
        //        db.Patients.Attach(hs);
        //        db.Patients.Remove(hs);
        //        db.SaveChanges();



        //        return hs.PatientName + " " + hs.PatientSurname + " was succesfully removed.";
        //    }

        //    catch (Exception ex)
        //    {

        //        return "Error: " + ex;
        //    }
        //}

        public HerbStock GetHerbStock(int herbStockID)
        {
            try
            {
                using (DispenseryEntities db = new DispenseryEntities())
                {
                    HerbStock hs = db.HerbStocks.Find(herbStockID);
                    return hs;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }
        public List<HerbStock> GetAllPatients()
        {
            try
            {
                using (DispenseryEntities db = new DispenseryEntities())
                {
                    List<HerbStock> herbStocks = (from x in db.HerbStocks
                                              select x).ToList();
                    return herbStocks;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }

    }
}