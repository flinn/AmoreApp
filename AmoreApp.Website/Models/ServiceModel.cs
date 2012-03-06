using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AmoreApp.Website.Models
{
    public class ServiceModel
    {
        public string GetTestString()
        {
            string result = "";
            UserServiceClient usc = new UserServiceClient();
            result = usc.GetHello();
            return result;
        }
    }
}