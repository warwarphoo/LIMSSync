using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Synchronization.Data;
using Microsoft.Synchronization.Data.SqlServer;

namespace ProvisionServer
{
    class Program
    {
        static void Main(string[] args)
        {
            string strscopename = Properties.Settings.Default["ScopeName"].ToString();
            string strserverConn = Properties.Settings.Default["serverConn"].ToString();            
            string strsyncTableEID = Properties.Settings.Default["syncTableEID"].ToString();
            string strsyncTableVL = Properties.Settings.Default["syncTableVL"].ToString();
            
            try
            {
                // connect to server database (The Public IP)
                SqlConnection serverConn = new SqlConnection(strserverConn);

                // define a new scope 
                DbSyncScopeDescription scopeDesc = new DbSyncScopeDescription(strscopename);

                // get the description of the VLSummaryReport table from SERVER database  
                DbSyncTableDescription syncTableEID = SqlSyncDescriptionBuilder.GetDescriptionForTable(strsyncTableEID, serverConn);
                DbSyncTableDescription syncTableVL = SqlSyncDescriptionBuilder.GetDescriptionForTable(strsyncTableVL, serverConn);

                // add the table description to the sync scope definition
                scopeDesc.Tables.Add(syncTableEID);
                scopeDesc.Tables.Add(syncTableVL);

                // create a server scope provisioning object based on the VLSyncScopeAlert
                SqlSyncScopeProvisioning serverProvision = new SqlSyncScopeProvisioning(serverConn, scopeDesc);
                serverProvision.SetCreateTableDefault(DbSyncCreationOption.Skip);
                serverProvision.Apply();

                Console.WriteLine("Server Successfully Provisioned.");
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
