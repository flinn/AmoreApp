using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace AmoreApp.AmoreAPI
{    
    public class UserService : IUserService
    {        
        public string GetHello()
        {
            return "Hello from my WCF service in Windows Azure!";
        }
    }
}
