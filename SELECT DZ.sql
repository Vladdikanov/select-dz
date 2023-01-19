
--исполнители в жанре
select g.name, count(*) from genre g
join artist_genre ag on g.genre_id = ag.genre_id
join artist a on ag.artist_id = a.artist_id
group by g.name;
--нет альбомов 2019 и 2020 годов, возьмем другие года. 2017 - 2018 пускай будут.
select count(*) from track 
join album a  on track.album_id  = a.album_id
where a.year between 2017 and 2018;
--средняя продолжительность треков по каждому альбому
select album.name, avg(t.duration) / 60 from album
join track t on album.album_id = t.album_id
group by album.name;
--все исполнители которые не выпустили альбомы 2017 году
select artist.name from artist
left join album_artist aa  on artist.artist_id = aa.artist_id
left join album a on a.album_id = aa.album_id
where not a.year = 2017;
-- названия альбомов где,есть треки FFDP
select m.name from mixtape m
join mixtape_track mt on m.mixtape_id = mt.mixtape_id
join track t on mt.track_id = t.track_id 
join album a on t.album_id = a.album_id
join album_artist aa on a.album_id = aa.album_id
join artist a2 on aa.artist_id = a2.artist_id
where a2.name = 'FFDP'
group by m.name;

--название альбомов где учавствуют исполнители более одного жанра
select album.name, count(*) from album
join album_artist aa on album.album_id = aa.album_id
join artist a on aa.artist_id = a.artist_id
join artist_genre ag on a.artist_id = ag.artist_id 
join genre g on ag.genre_id = g.genre_id
group by album.name
having count(*) > 1;
--Названия треков которые не входят в сборники
select track.name from track
left join mixtape_track mt on track.track_id = mt.track_id
left join mixtape m on mt.mixtape_id = m.mixtape_id
where m.name is null;
--исполнитель написавший самый короткий по продолжительности трек
select artist.name from artist
join album_artist aa  on artist.artist_id = aa.artist_id
join album a on a.album_id = aa.album_id
join track t on a.album_id = t.album_id
where t.duration = (select min(duration) from track);
--название альбомов содержащие наименьшее число треков
select album.name, count(*) from album
join track t on album.album_id = t.album_id
group by album.name
having count(*) = (select max(count(*)) from album);


