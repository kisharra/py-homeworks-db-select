create TABLE IF NOT EXISTS music_ganre (
	ganre_id int PRIMARY key,
	ganre_name VARCHAR(255) not null
);
create table IF NOT EXISTS bands (
	band_id int primary key,
	band_name VARCHAR(255) not null
);
create table IF NOT EXISTS discography (
	album_id int primary key,
	album_name VARCHAR(255) not NULL,
	released_in int NOT NULL CHECK (released_in >= 2000 AND released_in <= 2024)
);
create table IF NOT EXISTS tracks (
	track_id int primary key,
	track_title VARCHAR(255) not null,
	duration int NOT NULL,
	album_id int references discography(album_id)
);
create table IF NOT EXISTS collections (
	collections_id int primary key,
	collection_name VARCHAR(255) not null,
	release_date int NOT null
);
create table IF NOT EXISTS ganre_bands (
	ganre_id int not null references music_ganre,
	band_id int not null references bands,
	primary key (ganre_id, band_id)	
);
create TABLE IF NOT EXISTS bands_discography (
	band_id int not null references bands,
	album_id int not null references discography,
	primary key (band_id, album_id)		
);
create table IF NOT EXISTS tracks_collections (
	track_id int not null references tracks,
	collections_id int not null references collections,
	primary key (track_id, collections_id)
);