CREATE TABLE Genres (
    genre_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
);
CREATE TABLE Directors (
    director_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL
);
CREATE TABLE Actors (
    actor_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL    
);
CREATE TABLE Movies (
    movie_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(150) NOT NULL,
    release_year INT NOT NULL,
    rating DECIMAL(4,1) NOT NULL,
    runtime INT NOT NULL,
    genre_id INT NOT NULL,
    director_id INT NOT NULL,
    CONSTRAINT FK_Movies_Genres
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    CONSTRAINT FK_Movies_Directors
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);
CREATE TABLE MovieActors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT FK_MovieActors_Movies
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    CONSTRAINT FK_MovieActors_Actors
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);