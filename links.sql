alter table Download add [Link] nvarchar(MAX);

-- fix data
update journalists set Mastodon = trim(Mastodon);
update journalists set Mastodon = '@taylorlorenz@mastodon.social' where Mastodon = '@taylorlorenz.mastodon.social';
update journalists set Mastodon = '@shelley_wine@mastodon.social' where Mastodon = '@shelley_wine';
update journalists set Mastodon = '@jilleduffy@mastodon.social' where Mastodon = '@jilleduffy@mastondon.social';
update journalists set Mastodon = '@merryarty@mastodon.green' where Mastodon = '@merryarty';
delete from journalists where Timestamp = '11/6/2022 8:27:53'; -- not a journalist
delete from journalists where Mastodon = '@jacobytekel@sciences.social'; -- not a journalist
delete from journalists where Mastodon = '@elizgrenier@c.im'; -- non existant

-- Mastodon handles given as full link
update journalists set Link = Mastodon where Mastodon like 'http%';

-- regular Mastodon handles
update journalists set Link = 'https://' + SUBSTRING(Mastodon, CHARINDEX('@', Mastodon, 2) + 1, len(Mastodon)) + '/' + SUBSTRING(Mastodon, 0, CHARINDEX('@', Mastodon, 2))  from journalists
	where Mastodon like '@%@%'

-- Mastodon handles without leading @
update journalists set Link = 'https://' + SUBSTRING(Mastodon, CHARINDEX('@', Mastodon) + 1, len(Mastodon)) + '/@' + SUBSTRING(Mastodon, 0, CHARINDEX('@', Mastodon))  from journalists
	where Mastodon not like '@%' and Mastodon like '%@%' and Mastodon not like 'http%';




