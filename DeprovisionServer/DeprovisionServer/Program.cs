using Microsoft.Synchronization.Data;
using Microsoft.Synchronization.Data.SqlServer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeprovisionServer
{
    class Program
    {
        static void Main(string[] args)
        {           
            try
            {
                string strclientConn = TechnicalConfig.GetConfiguration()["clientConn"].ToString();
                string strscopename = TechnicalConfig.GetConfiguration()["ScopeName"].ToString();

                SqlConnection clientConn = new SqlConnection(@strclientConn);
                // define a new scope 
                //DbSyncScopeDescription scopeDesc = new DbSyncScopeDescription("SyncScopeCHAIComputer");
                // Remove the scope from the database
                //SqlSyncScopeDeprovisioning scopeDeprovisioning = new SqlSyncScopeDeprovisioning(serverConn);
                SqlSyncScopeDeprovisioning scopeDeprovisioning = new SqlSyncScopeDeprovisioning(clientConn);
                // Remove the scope.
                scopeDeprovisioning.DeprovisionScope(strscopename);

                Console.WriteLine("Server Successfully DeProvisioned.");
                Console.ReadLine();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.ReadLine();
            }
           
        }
    }
}
