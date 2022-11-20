-- fix data
update journalists set Mastodon = trim(Mastodon);
update journalists set Mastodon = '@taylorlorenz@mastodon.social' where Mastodon = '@taylorlorenz.mastodon.social';

-- Mastodon handles given as full link
update journalists set Link = Mastodon where Mastodon like 'http%';

-- regular Mastodon handles
update journalists set Link = 'https://' + SUBSTRING(Mastodon, CHARINDEX('@', Mastodon, 2) + 1, len(Mastodon)) + '/' + SUBSTRING(Mastodon, 0, CHARINDEX('@', Mastodon, 2))  from journalists
	where Mastodon like '@%@%'

-- Mastodon handles without leading @
update journalists set Link = 'https://' + SUBSTRING(Mastodon, CHARINDEX('@', Mastodon) + 1, len(Mastodon)) + '/@' + SUBSTRING(Mastodon, 0, CHARINDEX('@', Mastodon))  from journalists
	where Mastodon not like '@%' and Mastodon like '%@%' and Mastodon not like 'http%';




