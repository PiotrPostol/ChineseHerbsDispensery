using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dispensery
{
    public class HerbModel
    {
        public string InsertHerb(AllHerb allHerbs)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                db.AllHerbs.Add(allHerbs);
                db.SaveChanges();

                return allHerbs.HerbName + " was succesfully inserted.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }

        }

        public string UpdateHerb(string refNum, AllHerb allHerb)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                //fetch object from db
                AllHerb aH = db.AllHerbs.Find(refNum);
                aH.Active = allHerb.Active;
                aH.Description = allHerb.Description;
                aH.EnglishName = allHerb.EnglishName;
                aH.HerbName = allHerb.HerbName;
                aH.HerbNameChinese = allHerb.HerbNameChinese;
                aH.PharmaName = allHerb.PharmaName;
                aH.Temperature = allHerb.Temperature;
                db.SaveChanges();

                return allHerb.HerbName + " was succesfully updated.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }
        }

        public string DeleteHerb(string refNum)
        {
            try
            {
                DispenseryEntities db = new DispenseryEntities();
                AllHerb aH = db.AllHerbs.Find(refNum);
                db.AllHerbs.Attach(aH);
                db.AllHerbs.Remove(aH);
                db.SaveChanges();

               

                return  aH.HerbName + " was succesfully removed.";
            }

            catch (Exception ex)
            {

                return "Error: " + ex;
            }
        }
    }
}