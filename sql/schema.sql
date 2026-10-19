CREATE DATABASE IF NOT EXISTS game_studio_db
   CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE game_studio_db;
DROP TABLE IF EXISTS games;      -- child first (it depends on studios)
DROP TABLE IF EXISTS studios;
-- PARENT table
CREATE TABLE studios (
   studio_id      INT UNSIGNED  NOT NULL AUTO_INCREMENT PRIMARY KEY,
   studio_name    VARCHAR(100)  NOT NULL UNIQUE,
   founder_name   VARCHAR(100)  NOT NULL,
   email          VARCHAR(100)  NOT NULL UNIQUE,
   country        VARCHAR(60)   NOT NULL,
   year_founded   SMALLINT UNSIGNED NOT NULL,
   studio_type    VARCHAR(30)   NOT NULL,          -- Indie, Mobile, AAA ...
   website        VARCHAR(255)  NULL,
   date_added     DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- CHILD table: every game belongs to exactly one studio
CREATE TABLE games (
   game_id         INT UNSIGNED  NOT NULL AUTO_INCREMENT PRIMARY KEY,
   studio_id       INT UNSIGNED  NOT NULL,         -- foreign key to the parent
   title           VARCHAR(100)  NOT NULL,
   genre           VARCHAR(30)   NOT NULL,
   platform        VARCHAR(30)   NOT NULL,
   game_engine     VARCHAR(30)   NOT NULL,
   release_status  VARCHAR(20)   NOT NULL DEFAULT 'In Development',
   price           DECIMAL(8,2)  NOT NULL DEFAULT 0.00,
   release_date    DATE          NULL,
   date_added      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT uq_studio_title UNIQUE (studio_id, title),
   CONSTRAINT fk_games_studio FOREIGN KEY (studio_id)
       REFERENCES studios (studio_id)
       ON DELETE CASCADE       -- deleting a studio also deletes its games
       ON UPDATE CASCADE
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
