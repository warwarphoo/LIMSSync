USE [LISSyncDB]
GO
/****** Object:  Trigger [dbo].[VLSummary_insert_trigger]    Script Date: 10/22/2018 16:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[VLSummary_insert_trigger] ON [dbo].[VLSummary] FOR INSERT AS
UPDATE [side] SET [sync_row_is_tombstone] = 0, [local_update_peer_key] = 0, [restore_timestamp] = NULL, [update_scope_local_id] = NULL, [last_change_datetime] = GETDATE() FROM [VLSummary_tracking] [side] JOIN INSERTED AS [i] ON [side].[Id] = [i].[Id]
INSERT INTO [VLSummary_tracking] ([i].[Id], [create_scope_local_id], [local_create_peer_key], [local_create_peer_timestamp], [update_scope_local_id], [local_update_peer_key], [sync_row_is_tombstone], [last_change_datetime], [restore_timestamp]) SELECT [i].[Id], NULL, 0, @@DBTS+1, NULL, 0, 0, GETDATE() , NULL FROM INSERTED AS [i] LEFT JOIN [VLSummary_tracking] [side] ON [side].[Id] = [i].[Id] WHERE [side].[Id] IS NULL;
INSERT INTO [VLSummary_synced] ([Id],[last_change_datetime],[synced],[LabCode]) select i.[Id],GETDATE(),0,i.LabCode FROM INSERTED AS i