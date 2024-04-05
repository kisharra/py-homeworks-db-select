--Название и продолжительность самого длительного трека.
SELECT track_title, duration 
FROM tracks
WHERE duration = (SELECT max(duration) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_title
FROM tracks
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name
FROM collections
WHERE release_date BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT band_name
FROM bands
WHERE length(band_name) = length(REPLACE(band_name, ' ', ''));

--Название треков, которые содержат слово «мой» или «my».
SELECT track_title
FROM tracks
WHERE track_title LIKE '%my%' OR track_title LIKE '%My%';

--Количество исполнителей в каждом жанре.
SELECT music_ganre.ganre_name, count(DISTINCT ganre_bands.band_id) AS bands_quantity
FROM music_ganre
JOIN ganre_bands ON music_ganre.ganre_id = ganre_bands.ganre_id
GROUP BY music_ganre.ganre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(DISTINCT track_id) AS track_quantity
FROM discography
LEFT JOIN tracks ON tracks.album_id = discography.album_id
WHERE released_in >= 2019 AND released_in <= 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT album_name, avg(DISTINCT duration) AS agv_duration
FROM discography
LEFT JOIN tracks ON tracks.album_id = discography.album_id
GROUP BY album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT bands.band_name
FROM bands
LEFT JOIN bands_discography ON bands.band_id = bands_discography.band_id
LEFT JOIN discography ON bands_discography.album_id = discography.album_id
WHERE discography.released_in NOT IN (SELECT released_in FROM discography WHERE released_in = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель 'The Browning'.
SELECT DISTINCT collections.collection_name 
FROM collections
LEFT JOIN tracks_collections ON collections.collections_id = tracks_collections.collections_id 
LEFT JOIN tracks ON tracks_collections.track_id = tracks.track_id
LEFT JOIN discography ON tracks.album_id = discography.album_id 
LEFT JOIN bands_discography ON discography.album_id = bands_discography.album_id
LEFT JOIN bands ON bands_discography.band_id = bands.band_id 
WHERE bands.band_name = 'The Browning'




