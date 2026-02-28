CREATE TABLE Movies (
    movie_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(150) NOT NULL,
    genre NVARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    director NVARCHAR(100) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    runtime INT NOT NULL
)