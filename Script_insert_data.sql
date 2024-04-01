INSERT INTO music_ganre (ganre_id, ganre_name) VALUES (1, 'Heavy Metal');
INSERT INTO music_ganre (ganre_id, ganre_name) VALUES (2, 'Metalcore');
INSERT INTO music_ganre (ganre_id, ganre_name) VALUES (3, 'Death Metal');
INSERT INTO bands (band_id, band_name) VALUES (1, 'Axel Rudi Pell');
INSERT INTO bands (band_id, band_name) VALUES (2, 'W.A.S.P');
INSERT INTO bands (band_id, band_name) VALUES (3, 'Accept');
INSERT INTO bands (band_id, band_name) VALUES (4, 'Lamb of God');
INSERT INTO bands (band_id, band_name) VALUES (5, 'The Browning');
INSERT INTO bands (band_id, band_name) VALUES (6, 'Parkway Drive');
INSERT INTO bands (band_id, band_name) VALUES (7, 'Archspire');
INSERT INTO bands (band_id, band_name) VALUES (8, 'Orbit Culture');
INSERT INTO bands (band_id, band_name) VALUES (9, 'Cannibal Corpse');
INSERT INTO discography (album_id, album_name, released_in) VALUES (1, 'Into the Storm', 2016);
INSERT INTO discography (album_id, album_name, released_in) VALUES (2, 'Dying for the World', 2002);
INSERT INTO discography (album_id, album_name, released_in) VALUES (3, 'Blind Rage', 2014);
INSERT INTO discography (album_id, album_name, released_in) VALUES (4, 'Lamb of God', 2020);
INSERT INTO discography (album_id, album_name, released_in) VALUES (5, 'End of Existence', 2021);
INSERT INTO discography (album_id, album_name, released_in) VALUES (6, 'Darker Still', 2022);
INSERT INTO discography (album_id, album_name, released_in) VALUES (7, 'Bleed the Future', 2021);
INSERT INTO discography (album_id, album_name, released_in) VALUES (8, 'Nija', 2020);
INSERT INTO discography (album_id, album_name, released_in) VALUES (9, 'Chaos Horrific', 2023);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (1, 'Hey Hey My My', 303, 1);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (2, 'Long Way to Go', 333, 1);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (3, 'Hallowed Ground', 354, 2);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (4, 'Shadow Man', 334, 2);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (5, 'Fall of the Empire', 345, 3);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (6, 'From the Ashes We Rise', 353, 3);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (7, 'Memento Mori', 348, 4);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (8, 'Bloodshot Eyes', 237, 4);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (9, 'End of Existence', 240, 5);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (10, 'Rage', 183, 5);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (11, 'The Greatest Fear', 328, 6);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (12, 'Land of the Lost', 300, 6);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (13, 'Drone Corpse Aviator', 226, 7);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (14, 'Bleed the Future', 228, 7);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (15, 'At the Front', 188, 8);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (16, 'Behold', 313, 8);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (17, 'Blood Blind', 274, 9);
INSERT INTO tracks (track_id, track_title, duration, album_id) VALUES (18, 'Summoned for Sacrifice', 245, 9);
INSERT INTO collections (collections_id, collection_name, release_date) VALUES (1, 'Heavy Metal Top', 2019);
INSERT INTO collections (collections_id, collection_name, release_date) VALUES (2, 'Metalcore Top', 2020);
INSERT INTO collections (collections_id, collection_name, release_date) VALUES (3, 'Death Metal Top', 2024);
INSERT INTO collections (collections_id, collection_name, release_date) VALUES (4, 'Metal Ballads', 2021);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (1, 1);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (1, 2);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (1, 3);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (2, 4);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (2, 5);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (2, 6);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (3, 7);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (3, 8);
INSERT INTO ganre_bands (ganre_id, band_id) VALUES (3, 9);
INSERT INTO bands_discography (band_id, album_id) VALUES (1, 1);
INSERT INTO bands_discography (band_id, album_id) VALUES (2, 2);
INSERT INTO bands_discography (band_id, album_id) VALUES (3, 3);
INSERT INTO bands_discography (band_id, album_id) VALUES (4, 4);
INSERT INTO bands_discography (band_id, album_id) VALUES (5, 5);
INSERT INTO bands_discography (band_id, album_id) VALUES (6, 6);
INSERT INTO bands_discography (band_id, album_id) VALUES (7, 7);
INSERT INTO bands_discography (band_id, album_id) VALUES (8, 8);
INSERT INTO bands_discography (band_id, album_id) VALUES (9, 9);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (1, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (2, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (3, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (4, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (5, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (6, 1);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (7, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (8, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (9, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (10, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (11, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (12, 2);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (13, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (14, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (15, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (16, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (17, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (18, 3);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (1, 4);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (2, 4);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (3, 4);
INSERT INTO tracks_collections (track_id, collections_id) VALUES (4, 4);