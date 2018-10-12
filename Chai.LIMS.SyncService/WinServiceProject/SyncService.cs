using System;
using System.IO;

using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Synchronization;
using Microsoft.Synchronization.Data.SqlServer;
using Microsoft.Synchronization.Data;

namespace CHAI.LIMS.SyncService
{
     class SyncService : System.ServiceProcess.ServiceBase
    {
        // The main entry point for the process
        static void Main()
        {
            System.ServiceProcess.ServiceBase[] ServicesToRun;
            ServicesToRun = new System.ServiceProcess.ServiceBase[] { new SyncService() };
            System.ServiceProcess.ServiceBase.Run(ServicesToRun);
        }
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ServiceName = "ChaiLIMSSync";            
        }
        private string folderPath = @"c:\temp";
        private System.Timers.Timer tDoWork = new System.Timers.Timer();

        /// <summary>
        /// Set things in motion so your service can do its work.
        /// </summary>
        protected override void OnStart(string[] args)
        {
            string strmsg = " ChaiLIMSSyncService: Service Started at " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + "\n";
            WriteLogFile(strmsg);

           
            tDoWork.Interval = 60000; // 60 seconds
            tDoWork.Elapsed += new System.Timers.ElapsedEventHandler(this.OnTimer);
            tDoWork.Start();          

        }
        /// <summary>
        /// Stop this service.
        /// </summary>
        protected override void OnStop()
        {
            string strmsg = " ChaiLIMSSyncService: Service Stopped at " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + "\n";
            WriteLogFile(strmsg);

            tDoWork.Stop();

            tDoWork.Dispose();

        }

        public void OnTimer(object sender, System.Timers.ElapsedEventArgs args)
        {
           Dowork();
        }
        
        private void Dowork()
        {
            try
            {
                string strscopename = Properties.Settings.Default["ScopeName"].ToString();
                string strclientConn = Properties.Settings.Default["clientConn"].ToString();
                string strserverConn = Properties.Settings.Default["serverConn"].ToString();

                SqlConnection clientConn = new SqlConnection(@strclientConn);

                SqlConnection serverConn = new SqlConnection(@strserverConn);
                // create the sync orhcestrator to start and manage the session
                SyncOrchestrator syncOrchestrator = new SyncOrchestrator();

                // set local provider of orchestrator to a sync provider associated with the VLSyncScopeAlert in th local database

                syncOrchestrator.LocalProvider = new SqlSyncProvider(strscopename, clientConn);

                // set the remote provider of orchestrator to a server sync provider associated with VLSyncScopeAlert from the server

                syncOrchestrator.RemoteProvider = new SqlSyncProvider(strscopename, serverConn);

                // set the direction of sync session to Upload only to help populate data from the client to the server
                syncOrchestrator.Direction = SyncDirectionOrder.Upload;

                // subscribe for errors that occur when applying changes to the client

                ((SqlSyncProvider)syncOrchestrator.LocalProvider).ApplyChangeFailed += new EventHandler<DbApplyChangeFailedEventArgs>(Program_ApplyChangeFailed);

                // execute the synchronization process
                SyncOperationStatistics syncStats = syncOrchestrator.Synchronize();
              
                string strmsg = "Start Time: " + syncStats.SyncStartTime + "\n";
                strmsg += "Total Changes Uploaded: " + syncStats.UploadChangesTotal + "\n";
                strmsg+= "Uploads Failed: " + syncStats.UploadChangesFailed + "\n";
                strmsg+= "Total Changes Downloaded: " + syncStats.DownloadChangesTotal + "\n";
                strmsg+= "Complete Time: " + syncStats.SyncEndTime + "\n";
                WriteLogFile(strmsg);                

            }
            catch (Exception e)
            {
               WriteLogFile("Error Message: " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + e.Message + "\n");
            }
        }

         void Program_ApplyChangeFailed(object sender, DbApplyChangeFailedEventArgs e)
        {
            string strmsg = "Error Type: " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + e.Conflict.Type + "\n";
            strmsg += "Error Message: " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + e.Error + "\n";
            WriteLogFile(strmsg);
        }
        void WriteLogFile(string strerrormsg)
        {
            if (!System.IO.Directory.Exists(folderPath))
                System.IO.Directory.CreateDirectory(folderPath);
            FileStream fs = new FileStream(folderPath + "\\ChaiLIMSSyncService.txt", FileMode.OpenOrCreate, FileAccess.Write);
            StreamWriter m_streamWriter = new StreamWriter(fs);
            m_streamWriter.BaseStream.Seek(0, SeekOrigin.End);
            m_streamWriter.WriteLine(strerrormsg);          

            m_streamWriter.Flush();
            m_streamWriter.Close();
        }
    }
}