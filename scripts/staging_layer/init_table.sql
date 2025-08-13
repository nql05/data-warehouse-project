--Create tables for data in schema bronze--
CREATE TABLE bronze.appearances (
  appearance_id VARCHAR(255) NOT NULL,
  game_id INT DEFAULT NULL,
  player_id INT DEFAULT NULL,
  player_club_id INT DEFAULT NULL,
  player_current_club_id INT DEFAULT NULL,
  date DATE DEFAULT NULL,
  player_name VARCHAR(255) DEFAULT NULL,
  competition_id VARCHAR(255) NOT NULL,
  yellow_cards INT DEFAULT NULL,
  red_cards INT DEFAULT NULL,
  goals INT DEFAULT NULL,
  assists INT DEFAULT NULL,
  minutes_played INT DEFAULT NULL,
  PRIMARY KEY (appearance_id)
);

CREATE TABLE bronze.club_games (
  club_games_id SERIAL PRIMARY KEY,
  game_id INT,
  club_id INT,
  own_goals INT,
  own_position VARCHAR(255),
  own_manager_name VARCHAR(255),
  opponent_id INT,
  opponent_goals INT,
  opponent_position VARCHAR(255),
  opponent_manager_name VARCHAR(255),
  hosting VARCHAR(255),
  is_win BOOLEAN
);

CREATE TABLE bronze.clubs (
  club_id INT NOT NULL,
  club_code VARCHAR(50) DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  domestic_competition_id VARCHAR(255) DEFAULT NULL,
  total_market_value FLOAT DEFAULT NULL,
  squad_size INT DEFAULT NULL,
  average_age FLOAT DEFAULT NULL,
  foreigners_number INT DEFAULT NULL,
  foreigners_percentage FLOAT DEFAULT NULL,
  national_team_players INT DEFAULT NULL,
  stadium_name VARCHAR(255) DEFAULT NULL,
  stadium_seats INT DEFAULT NULL,
  net_transfer_record VARCHAR(255) DEFAULT NULL,
  coach_name VARCHAR(255) DEFAULT NULL,
  last_season VARCHAR(50) DEFAULT NULL,
  filename VARCHAR(255) DEFAULT NULL,
  url VARCHAR(500) DEFAULT NULL,
  PRIMARY KEY (club_id)
);

CREATE TABLE bronze.game_events (
  game_event_id VARCHAR(255) NOT NULL,
  date DATE DEFAULT NULL,
  game_id INT DEFAULT NULL,
  minute INT DEFAULT NULL,
  type VARCHAR(255) DEFAULT NULL,
  club_id INT DEFAULT NULL,
  player_id INT DEFAULT NULL,
  description VARCHAR(500) DEFAULT NULL,
  player_in_id INT DEFAULT NULL,
  player_assist_id INT DEFAULT NULL,
  PRIMARY KEY (game_event_id)
);

CREATE TABLE bronze.game_lineups (
  game_lineups_id VARCHAR(255) PRIMARY KEY,
  date DATE,
  game_id INT,
  player_id INT,
  club_id INT,
  player_name VARCHAR(255),
  type VARCHAR(255),
  position VARCHAR(50),
  number VARCHAR(25),
  team_captain BOOLEAN
);

CREATE TABLE bronze.games (
  game_id INT NOT NULL,
  competition_id VARCHAR(255) DEFAULT NULL,
  season VARCHAR(50) DEFAULT NULL,
  round VARCHAR(255) DEFAULT NULL,
  date DATE DEFAULT NULL,
  home_club_id VARCHAR(255) DEFAULT NULL,
  away_club_id VARCHAR(255) DEFAULT NULL,
  home_club_goals VARCHAR(255) DEFAULT NULL,
  away_club_goals VARCHAR(255) DEFAULT NULL,
  home_club_position VARCHAR(50) DEFAULT NULL,
  away_club_position VARCHAR(50) DEFAULT NULL,
  home_club_manager_name VARCHAR(255) DEFAULT NULL,
  away_club_manager_name VARCHAR(255) DEFAULT NULL,
  stadium VARCHAR(255) DEFAULT NULL,
  attendance VARCHAR(255) DEFAULT NULL,
  referee VARCHAR(255) DEFAULT NULL,
  url VARCHAR(500) DEFAULT NULL,
  home_club_formation VARCHAR(50) DEFAULT NULL,
  away_club_formation VARCHAR(50) DEFAULT NULL,
  home_club_name VARCHAR(255) DEFAULT NULL,
  away_club_name VARCHAR(255) DEFAULT NULL,
  aggregate VARCHAR(255) DEFAULT NULL,
  competition_type VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (game_id)
);

CREATE TABLE bronze.player_valuations (
  player_id BIGINT NOT NULL,
  date TEXT,
  market_value_in_eur BIGINT DEFAULT NULL,
  current_club_id BIGINT DEFAULT NULL,
  player_club_domestic_competition_id TEXT,
  PRIMARY KEY (player_id, date) 
);

CREATE TABLE bronze.players (
  player_id INT NOT NULL,
  first_name VARCHAR(255) DEFAULT NULL,
  last_name VARCHAR(255) DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  last_season VARCHAR(50) DEFAULT NULL,
  current_club_id INT DEFAULT NULL,
  player_code VARCHAR(50) DEFAULT NULL,
  country_of_birth VARCHAR(255) DEFAULT NULL,
  city_of_birth VARCHAR(255) DEFAULT NULL,
  country_of_citizenship VARCHAR(255) DEFAULT NULL,
  date_of_birth DATE DEFAULT NULL,
  sub_position VARCHAR(100) DEFAULT NULL,
  position VARCHAR(100) DEFAULT NULL,
  foot VARCHAR(50) DEFAULT NULL,
  height_in_cm INT DEFAULT NULL,
  contract_expiration_date DATE DEFAULT NULL,
  agent_name VARCHAR(255) DEFAULT NULL,
  image_url VARCHAR(500) DEFAULT NULL,
  url VARCHAR(500) DEFAULT NULL,
  current_club_domestic_competition_id VARCHAR(255) DEFAULT NULL,
  current_club_name VARCHAR(255) DEFAULT NULL,
  market_value_in_eur FLOAT DEFAULT NULL,
  highest_market_value_in_eur FLOAT DEFAULT NULL,
  PRIMARY KEY (player_id)
);

CREATE TABLE bronze.competitions (
  competition_id VARCHAR(255) PRIMARY KEY,
  competition_code VARCHAR(50),
  name VARCHAR(255),
  sub_type VARCHAR(255),
  type VARCHAR(255),
  country_id INT,
  country_name VARCHAR(255),
  domestic_league_code VARCHAR(50),
  confederation VARCHAR(255),
  url VARCHAR(500),
  is_major_national_league BOOLEAN
);

CREATE TABLE bronze.transfer (
  transfer_id SERIAL PRIMARY KEY,
  player_id INT NOT NULL,
  transfer_date DATE NOT NULL,
  transfer_season VARCHAR(50),
  from_club_id INT,
  to_club_id INT,
  from_club_name VARCHAR(255),
  to_club_name VARCHAR(255),
  transfer_fee DOUBLE PRECISION,
  market_value_in_eur DOUBLE PRECISION,
  player_name VARCHAR(255),
  FOREIGN KEY (player_id) REFERENCES bronze.players(player_id) ON DELETE CASCADE
);


