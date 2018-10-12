using System;
using System.Data.SqlClient;
using Microsoft.Synchronization;
using Microsoft.Synchronization.Data;
using Microsoft.Synchronization.Data.SqlServer;
using System.Data.SqlServerCe;
using System.Data;
using System.Collections.Generic;

namespace ProvisionClient
{
    class Program
    {        
        static void Main(string[] args)
        {
            string strscopename = Properties.Settings.Default["ScopeName"].ToString();          
            string strclientConn = Properties.Settings.Default["clientConn"].ToString();
            string strserverConn = Properties.Settings.Default["serverConn"].ToString();
            try
            {
                SqlConnection clientConn = new SqlConnection(@strclientConn);
                SqlConnection serverConn = new SqlConnection(@strserverConn);

                // Obtain the description of VLSummaryReport table from the server using the scope name
                DbSyncScopeDescription scopeDesc = SqlSyncDescriptionBuilder.GetDescriptionForScope(strscopename, serverConn);              
                SqlSyncScopeProvisioning clientProvision = new SqlSyncScopeProvisioning(clientConn, scopeDesc);
                clientProvision.Apply();
                Console.WriteLine("Client Successfully Provisioned.");
                Console.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message + ex.Data.ToString());
                Console.ReadLine();
            }
        }
    }
}
