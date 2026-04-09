CREATE DATABASE MovieDB
GO 
USE MovieDB
GO
CREATE SCHEMA movie_schema
GO
CREATE TABLE movie_schema.actor (
    act_id      INT PRIMARY KEY,
    act_fname   CHAR(20),
    act_lname   CHAR(20),
    act_gender  CHAR(1)
)

CREATE TABLE movie_schema.director (
    dir_id      INT PRIMARY KEY,
    dir_fname   CHAR(20),
    dir_lname   CHAR(20)
)

CREATE TABLE movie_schema.reviewer (
    rev_id      INT PRIMARY KEY,
    rev_name    CHAR(30)
)
 
CREATE TABLE movie_schema.genres (
    gen_id      INT PRIMARY KEY,
    gen_title   CHAR(20)
)
 
CREATE TABLE movie_schema.movie (
    mov_id          INT PRIMARY KEY,
    mov_title       CHAR(50),
    mov_year        INT,
    mov_time        INT,
    mov_lang        CHAR(50),
    mov_dt_rel      DATE,
    mov_rel_country CHAR(5)
)
 
CREATE TABLE movie_schema.movie_cast (
    act_id  INT FOREIGN KEY REFERENCES movie_schema.actor(act_id),
    mov_id  INT FOREIGN KEY REFERENCES movie_schema.movie(mov_id),
    role    CHAR(30)
)
 
CREATE TABLE movie_schema.movie_direction (
    dir_id  INT FOREIGN KEY REFERENCES movie_schema.director(dir_id),
    mov_id  INT FOREIGN KEY REFERENCES movie_schema.movie(mov_id)
)
 
CREATE TABLE movie_schema.movie_genres (
    mov_id  INT FOREIGN KEY REFERENCES movie_schema.movie(mov_id),
    gen_id  INT FOREIGN KEY REFERENCES movie_schema.genres(gen_id)
)
 
CREATE TABLE movie_schema.rating (
    mov_id        INT FOREIGN KEY REFERENCES movie_schema.movie(mov_id),
    rev_id        INT FOREIGN KEY REFERENCES movie_schema.reviewer(rev_id),
    rev_stars     INT,
    num_o_ratings INT
)
