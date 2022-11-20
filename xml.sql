/****** Script for SelectTopNRows command from SSMS  ******/
declare @result XML = (
	SELECT [Timestamp]
		  ,[Mastodon]
		  ,[Twitter]
		  ,[Main]
		  ,[Outlets]
		  ,[Other]
		  ,[Link]
		  ,[Name]
  FROM [Journalists].[dbo].[Journalists]
  for xml path('Journalist'), Root ('Journalists'));

set @result.modify('
    insert <?xml-stylesheet type="text/xsl" href="journalists.xsl"?>
    before /*[1]')

select @result;