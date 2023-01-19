create table if not exists artist (
artist_id serial primary key not null,
name varchar(20) not null);

create table if not exists genre (
genre_id serial primary key not null,
name varchar(20) not null);


create table if not exists artist_genre (
artist_id integer references artist(artist_id),
genre_id integer references genre(genre_id),
constraint ag primary key(artist_id, genre_id));

create table if not exists album (
album_id serial primary key not null,
name varchar(20) not null,
year integer not null);

create table if not exists album_artist (
artist_id integer references artist(artist_id),
album_id integer references album(album_id),
constraint aa primary key(artist_id, album_id));

create table if not exists MixTape (
mixtape_id serial primary key not null,
name varchar(20) not null,
year integer not null);


create table if not exists track (
track_id serial primary key not null,
name varchar(20) not null,
duration integer not null,
album_id integer references album(album_id));

create table if not exists MixTape_track (
mixtape_id integer references MixTape(mixtape_id),
track_id integer references track(track_id),
constraint mt primary key(track_id, mixtape_id));

