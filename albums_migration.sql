CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;
CREATE TABLE IF NOT EXISTS albums (
    id INT(10) unsigned NOT NULL AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    release_date INT(4) NOT NULL,
    sales FLOAT(10,2) NOT NULL,
    genre CHAR(100) NOT NULL,
    primary key (id)
);
