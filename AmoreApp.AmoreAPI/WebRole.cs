using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using System.ServiceModel;
using System.ServiceModel.Description;

namespace AmoreApp.AmoreAPI
{
    public class WebRole : RoleEntryPoint
    {
        private ServiceHost selfHost; 

        public override bool OnStart()
        {
            // To enable the AzureLocalStorageTraceListner, uncomment relevent section in the web.config  
            DiagnosticMonitorConfiguration diagnosticConfig = DiagnosticMonitor.GetDefaultInitialConfiguration();
            diagnosticConfig.Directories.ScheduledTransferPeriod = TimeSpan.FromMinutes(1);
            diagnosticConfig.Directories.DataSources.Add(AzureLocalStorageTraceListener.GetLogDirectory());

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            Uri baseAddress = new Uri("http://localHost:8000/AmoreApp.Api/UserService");
            selfHost = new ServiceHost(typeof(UserService), baseAddress);
            selfHost.AddServiceEndpoint(typeof(IUserService), new WSHttpBinding(), "UserService");

            ServiceMetadataBehavior smb = new ServiceMetadataBehavior();
            smb.HttpGetEnabled = true;
            selfHost.Description.Behaviors.Add(smb);
            
            selfHost.Open();

            return base.OnStart();
        }
        public override void OnStop()
        {
            selfHost.Close();
            base.OnStop();
        }
    }
}
