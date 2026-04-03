-- genres
INSERT INTO Genres (name) VALUES
('Action'),
('Crime'),
('Drama'),
('Horror'),
('Sci-Fi'),
('Thriller'),
('War'),
('Western');

-- directors
INSERT INTO Directors (name, last_name) VALUES
('Alfonso', 'Cuaron'),
('Brian', 'De Palma'),
('Christopher', 'Nolan'),
('Coen', 'Brothers'),
('Damien', 'Chazelle'),
('David', 'Fincher'),
('David', 'Lynch'),
('Denis', 'Villeneuve'),
('George', 'Miller'),
('James', 'Cameron'),
('Jan', 'de Bont'),
('John', 'McTiernan'),
('Jonathan', 'Demme'),
('Martin', 'Scorsese'),
('Michael', 'Bay'),
('Michael', 'Mann'),
('Park', 'Chan-wook'),
('Paul', 'Thomas Anderson'),
('Paul', 'Verhoeven'),
('Quentin', 'Tarantino'),
('Ridley', 'Scott'),
('Robert', 'Zemeckis'),
('Stanley', 'Kubrick'),
('Steven', 'Spielberg'),
('Wachowski', 'Sisters');

--movies
INSERT INTO Movies (title, release_year, rating, runtime, genre_id, director_id)
SELECT 'Terminator 2', 1991, 9.1, 137,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'James' AND last_name = 'Cameron')
UNION ALL
SELECT 'The Matrix', 1999, 8.7, 136,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Wachowski' AND last_name = 'Sisters')
UNION ALL
SELECT 'Pulp Fiction', 1994, 8.9, 154,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Quentin' AND last_name = 'Tarantino')
UNION ALL
SELECT 'Schindlers List', 1993, 9.0, 195,
    (SELECT genre_id FROM Genres WHERE name = 'Drama'),
    (SELECT director_id FROM Directors WHERE name = 'Steven' AND last_name = 'Spielberg')
UNION ALL
SELECT 'The Rock', 1996, 7.4, 136,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Michael' AND last_name = 'Bay')
UNION ALL
SELECT 'Speed', 1994, 7.2, 116,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Jan' AND last_name = 'De Bont')
UNION ALL
SELECT 'Forrest Gump', 1994, 8.8, 142,
    (SELECT genre_id FROM Genres WHERE name = 'Drama'),
    (SELECT director_id FROM Directors WHERE name = 'Robert' AND last_name = 'Zemeckis')
UNION ALL
SELECT 'The Silence of the Lambs', 1991, 8.6, 118,
    (SELECT genre_id FROM Genres WHERE name = 'Thriller'),
    (SELECT director_id FROM Directors WHERE name = 'Jonathan' AND last_name = 'Demme')
UNION ALL
SELECT 'GoodFellas', 1990, 8.7, 146,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Martin' AND last_name = 'Scorsese')
UNION ALL
SELECT 'Heat', 1995, 8.3, 170,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Michael' AND last_name = 'Mann')
UNION ALL
SELECT 'The Terminator', 1984, 8.1, 107,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'James' AND last_name = 'Cameron')
UNION ALL
SELECT 'Blade Runner', 1982, 8.1, 117,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Ridley' AND last_name = 'Scott')
UNION ALL
SELECT 'RoboCop', 1987, 7.6, 102,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Paul' AND last_name = 'Verhoeven')
UNION ALL
SELECT 'Die Hard', 1988, 8.2, 132,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'John' AND last_name = 'McTiernan')
UNION ALL
SELECT 'Full Metal Jacket', 1987, 8.3, 116,
    (SELECT genre_id FROM Genres WHERE name = 'War'),
    (SELECT director_id FROM Directors WHERE name = 'Stanley' AND last_name = 'Kubrick')
UNION ALL
SELECT 'Predator', 1987, 7.8, 107,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'John' AND last_name = 'McTiernan')
UNION ALL
SELECT 'Back to the Future', 1985, 8.5, 116,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Robert' AND last_name = 'Zemeckis')
UNION ALL
SELECT 'Scarface', 1983, 8.3, 170,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Brian' AND last_name = 'De Palma')
UNION ALL
SELECT 'Aliens', 1986, 8.4, 137,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'James' AND last_name = 'Cameron')
UNION ALL
SELECT 'The Shining', 1980, 8.4, 146,
    (SELECT genre_id FROM Genres WHERE name = 'Horror'),
    (SELECT director_id FROM Directors WHERE name = 'Stanley' AND last_name = 'Kubrick')
UNION ALL
SELECT 'Gladiator', 2000, 8.5, 155,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Ridley' AND last_name = 'Scott')
UNION ALL
SELECT 'Memento', 2000, 8.5, 113,
    (SELECT genre_id FROM Genres WHERE name = 'Thriller'),
    (SELECT director_id FROM Directors WHERE name = 'Christopher' AND last_name = 'Nolan')
UNION ALL
SELECT 'The Dark Knight', 2008, 9.0, 152,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'Christopher' AND last_name = 'Nolan')
UNION ALL
SELECT 'No Country for Old Men', 2007, 8.2, 122,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Coen' AND last_name = 'Brothers')
UNION ALL
SELECT 'There Will Be Blood', 2007, 8.2, 158,
    (SELECT genre_id FROM Genres WHERE name = 'Drama'),
    (SELECT director_id FROM Directors WHERE name = 'Paul' AND last_name = 'Thomas Anderson')
UNION ALL
SELECT 'The Departed', 2006, 8.5, 151,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Martin' AND last_name = 'Scorsese')
UNION ALL
SELECT 'Inglourious Basterds', 2009, 8.3, 153,
    (SELECT genre_id FROM Genres WHERE name = 'War'),
    (SELECT director_id FROM Directors WHERE name = 'Quentin' AND last_name = 'Tarantino')
UNION ALL
SELECT 'Children of Men', 2006, 7.9, 109,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Alfonso' AND last_name = 'Cuaron')
UNION ALL
SELECT 'Mulholland Drive', 2001, 7.9, 147,
    (SELECT genre_id FROM Genres WHERE name = 'Thriller'),
    (SELECT director_id FROM Directors WHERE name = 'David' AND last_name = 'Lynch')
UNION ALL
SELECT 'Oldboy', 2003, 8.4, 120,
    (SELECT genre_id FROM Genres WHERE name = 'Thriller'),
    (SELECT director_id FROM Directors WHERE name = 'Park' AND last_name = 'Chan-wook')
UNION ALL
SELECT 'Inception', 2010, 8.8, 148,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Christopher' AND last_name = 'Nolan')
UNION ALL
SELECT 'The Social Network', 2010, 7.8, 120,
    (SELECT genre_id FROM Genres WHERE name = 'Drama'),
    (SELECT director_id FROM Directors WHERE name = 'David' AND last_name = 'Fincher')
UNION ALL
SELECT 'Mad Max Fury Road', 2015, 8.1, 120,
    (SELECT genre_id FROM Genres WHERE name = 'Action'),
    (SELECT director_id FROM Directors WHERE name = 'George' AND last_name = 'Miller')
UNION ALL
SELECT 'Interstellar', 2014, 8.7, 169,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Christopher' AND last_name = 'Nolan')
UNION ALL
SELECT 'Whiplash', 2014, 8.5, 107,
    (SELECT genre_id FROM Genres WHERE name = 'Drama'),
    (SELECT director_id FROM Directors WHERE name = 'Damien' AND last_name = 'Chazelle')
UNION ALL
SELECT 'Gone Girl', 2014, 7.8, 149,
    (SELECT genre_id FROM Genres WHERE name = 'Thriller'),
    (SELECT director_id FROM Directors WHERE name = 'David' AND last_name = 'Fincher')
UNION ALL
SELECT 'The Wolf of Wall Street', 2013, 8.2, 180,
    (SELECT genre_id FROM Genres WHERE name = 'Crime'),
    (SELECT director_id FROM Directors WHERE name = 'Martin' AND last_name = 'Scorsese')
UNION ALL
SELECT 'Django Unchained', 2012, 8.4, 165,
    (SELECT genre_id FROM Genres WHERE name = 'Western'),
    (SELECT director_id FROM Directors WHERE name = 'Quentin' AND last_name = 'Tarantino')
UNION ALL
SELECT 'Arrival', 2016, 7.9, 116,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Denis' AND last_name = 'Villeneuve')
UNION ALL
SELECT 'Blade Runner 2049', 2017, 8.0, 164,
    (SELECT genre_id FROM Genres WHERE name = 'Sci-Fi'),
    (SELECT director_id FROM Directors WHERE name = 'Denis' AND last_name = 'Villeneuve');

--actors
INSERT INTO Actors (name, last_name) VALUES
('Arnold', 'Schwarzenegger'),
('Linda', 'Hamilton'),
('Keanu', 'Reeves'),
('Carrie-Anne', 'Moss'),
('John', 'Travolta'),
('Uma', 'Thurman'),
('Tom', 'Hanks'),
('Mel', 'Gibson'),
('Sigourney', 'Weaver'),
('Harrison', 'Ford'),
('Jack', 'Nicholson'),
('Shelley', 'Duvall'),
('Bruce', 'Willis'),
('Al', 'Pacino'),
('Brad', 'Pitt'),
('Morgan', 'Freeman'),
('Leonardo', 'DiCaprio'),
('Matt', 'Damon'),
('Christian', 'Bale'),
('Heath', 'Ledger'),
('Liam', 'Neeson'),
('Anthony', 'Hopkins'),
('Jodie', 'Foster'),
('Ray', 'Liotta'),
('Robert', 'De Niro'),
('Russell', 'Crowe'),
('Joaquin', 'Phoenix'),
('Guy', 'Pearce'),
('Michael J.', 'Fox'),
('Christopher', 'Lloyd'),
('Matthew', 'McConaughey'),
('Tom', 'Hardy'),
('Ryan', 'Gosling'),
('Jamie', 'Foxx'),
('Jesse', 'Eisenberg');

--MovieActors table 
INSERT INTO MovieActors (movie_id, actor_id)
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Terminator 2'),
    (SELECT actor_id FROM Actors WHERE name = 'Arnold' AND last_name = 'Schwarzenegger')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Terminator 2'),
    (SELECT actor_id FROM Actors WHERE name = 'Linda' AND last_name = 'Hamilton')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Matrix'),
    (SELECT actor_id FROM Actors WHERE name = 'Keanu' AND last_name = 'Reeves')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Matrix'),
    (SELECT actor_id FROM Actors WHERE name = 'Carrie-Anne' AND last_name = 'Moss')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Pulp Fiction'),
    (SELECT actor_id FROM Actors WHERE name = 'John' AND last_name = 'Travolta')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Pulp Fiction'),
    (SELECT actor_id FROM Actors WHERE name = 'Uma' AND last_name = 'Thurman')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Schindlers List'),
    (SELECT actor_id FROM Actors WHERE name = 'Liam' AND last_name = 'Neeson')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Silence of the Lambs'),
    (SELECT actor_id FROM Actors WHERE name = 'Anthony' AND last_name = 'Hopkins')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Silence of the Lambs'),
    (SELECT actor_id FROM Actors WHERE name = 'Jodie' AND last_name = 'Foster')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'GoodFellas'),
    (SELECT actor_id FROM Actors WHERE name = 'Ray' AND last_name = 'Liotta')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'GoodFellas'),
    (SELECT actor_id FROM Actors WHERE name = 'Robert' AND last_name = 'De Niro')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Heat'),
    (SELECT actor_id FROM Actors WHERE name = 'Al' AND last_name = 'Pacino')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Heat'),
    (SELECT actor_id FROM Actors WHERE name = 'Robert' AND last_name = 'De Niro')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Back to the Future'),
    (SELECT actor_id FROM Actors WHERE name = 'Michael J.' AND last_name = 'Fox')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Back to the Future'),
    (SELECT actor_id FROM Actors WHERE name = 'Christopher' AND last_name = 'Lloyd')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Scarface'),
    (SELECT actor_id FROM Actors WHERE name = 'Al' AND last_name = 'Pacino')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Aliens'),
    (SELECT actor_id FROM Actors WHERE name = 'Sigourney' AND last_name = 'Weaver')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Blade Runner'),
    (SELECT actor_id FROM Actors WHERE name = 'Harrison' AND last_name = 'Ford')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Blade Runner 2049'),
    (SELECT actor_id FROM Actors WHERE name = 'Harrison' AND last_name = 'Ford')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Blade Runner 2049'),
    (SELECT actor_id FROM Actors WHERE name = 'Ryan' AND last_name = 'Gosling')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Die Hard'),
    (SELECT actor_id FROM Actors WHERE name = 'Bruce' AND last_name = 'Willis')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Django Unchained'),
    (SELECT actor_id FROM Actors WHERE name = 'Jamie' AND last_name = 'Foxx')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Forrest Gump'),
    (SELECT actor_id FROM Actors WHERE name = 'Tom' AND last_name = 'Hanks')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Gladiator'),
    (SELECT actor_id FROM Actors WHERE name = 'Russell' AND last_name = 'Crowe')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Gladiator'),
    (SELECT actor_id FROM Actors WHERE name = 'Joaquin' AND last_name = 'Phoenix')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Inception'),
    (SELECT actor_id FROM Actors WHERE name = 'Leonardo' AND last_name = 'DiCaprio')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Inglourious Basterds'),
    (SELECT actor_id FROM Actors WHERE name = 'Brad' AND last_name = 'Pitt')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Interstellar'),
    (SELECT actor_id FROM Actors WHERE name = 'Matthew' AND last_name = 'McConaughey')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Mad Max Fury Road'),
    (SELECT actor_id FROM Actors WHERE name = 'Tom' AND last_name = 'Hardy')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'Memento'),
    (SELECT actor_id FROM Actors WHERE name = 'Guy' AND last_name = 'Pearce')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Departed'),
    (SELECT actor_id FROM Actors WHERE name = 'Leonardo' AND last_name = 'DiCaprio')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Departed'),
    (SELECT actor_id FROM Actors WHERE name = 'Matt' AND last_name = 'Damon')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Dark Knight'),
    (SELECT actor_id FROM Actors WHERE name = 'Christian' AND last_name = 'Bale')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Dark Knight'),
    (SELECT actor_id FROM Actors WHERE name = 'Heath' AND last_name = 'Ledger')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Shining'),
    (SELECT actor_id FROM Actors WHERE name = 'Jack' AND last_name = 'Nicholson')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Shining'),
    (SELECT actor_id FROM Actors WHERE name = 'Shelley' AND last_name = 'Duvall')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Social Network'),
    (SELECT actor_id FROM Actors WHERE name = 'Jesse' AND last_name = 'Eisenberg')
UNION ALL
SELECT
    (SELECT movie_id FROM Movies WHERE title = 'The Wolf of Wall Street'),
    (SELECT actor_id FROM Actors WHERE name = 'Leonardo' AND last_name = 'DiCaprio');