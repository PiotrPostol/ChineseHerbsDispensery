using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dispensery
{
    public class AllHerbsModel
    {
        public AllHerb GetAllHerb(string allHerbID)
        {
            try
            {
                using (DispenseryEntities db = new DispenseryEntities())
                {
                    AllHerb ah = db.AllHerbs.Find(allHerbID);
                    return ah;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }
        public AllHerb GetHerbByName(string HerbName)
        {
            try
            {
                using (DispenseryEntities db = new DispenseryEntities())
                {
                    AllHerb ah = db.AllHerbs.SingleOrDefault(AllHerb => AllHerb.HerbName == HerbName);
                    return ah;
                }
            }
            catch (Exception)
            {

                return null;
            }
        }

    }
}