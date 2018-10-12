namespace CHAI.LIMS.SyncService
{
    using System;

    /// <summary>
    ///     Summary description for ProjectInstaller.
    /// </summary>
    [System.ComponentModel.RunInstaller(true)]
    public  class ProjectInstaller : System.Configuration.Install.Installer
    {
        /// <summary>
        ///    Required designer variable.
        /// </summary>
        //private System.ComponentModel.Container components;
        private System.ServiceProcess.ServiceInstaller serviceInstaller;
        private System.ServiceProcess.ServiceProcessInstaller serviceProcessInstaller;

        public ProjectInstaller()
        {
            // This call is required by the Designer.
            InitializeComponent();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.serviceInstaller = new System.ServiceProcess.ServiceInstaller();
            this.serviceProcessInstaller = new System.ServiceProcess.ServiceProcessInstaller();
            // 
            // serviceInstaller
            // 
            this.serviceInstaller.Description = "CHAI LIMS Synchronization ";
            this.serviceInstaller.DisplayName = "ChaiLIMSSync Service";
            this.serviceInstaller.ServiceName = "ChaiLIMSSync";
            this.serviceInstaller.AfterInstall += new System.Configuration.Install.InstallEventHandler(this.serviceInstaller_AfterInstall);
            // 
            // serviceProcessInstaller
            // 
            this.serviceProcessInstaller.Account = System.ServiceProcess.ServiceAccount.LocalService;
            this.serviceProcessInstaller.Password = null;
            this.serviceProcessInstaller.Username = null;
            this.serviceProcessInstaller.AfterInstall += new System.Configuration.Install.InstallEventHandler(this.serviceProcessInstaller_AfterInstall);
            // 
            // ProjectInstaller
            // 
            this.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.serviceProcessInstaller,
            this.serviceInstaller});

        }

        private void serviceInstaller_AfterInstall(object sender, System.Configuration.Install.InstallEventArgs e)
        {
            using (System.ServiceProcess.ServiceController sc = new System.ServiceProcess.ServiceController(serviceInstaller.ServiceName))
            {
                sc.Start();
            }
        }

        private void serviceProcessInstaller_AfterInstall(object sender, System.Configuration.Install.InstallEventArgs e)
        {

        }
    }
}