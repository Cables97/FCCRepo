#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
 echo $($PSQL "DROP TABLE games")
 echo $($PSQL "DROP TABLE teams")

# Create Teams Table
# teams table = team_id serial pri/ name unique
echo $($PSQL "CREATE TABLE teams
              (team_id SERIAL NOT NULL,
              name VARCHAR(15) NOT NULL UNIQUE,
              PRIMARY KEY(team_id)
              )")

# Create Games table
# games table = game_id serial pri/ year int/ round varchar/ winner_id/ opponent_id/ winner_goals / opponent_goals

echo $($PSQL "CREATE TABLE games
              (game_id SERIAL NOT NULL,
              year INT NOT NULL,
              round VARCHAR(20) NOT NULL,
              winner_id INT NOT NULL,
              opponent_id INT NOT NULL,
              winner_goals INT NOT NULL,
              opponent_goals INT NOT NULL,
              PRIMARY KEY(game_id)
              )")

echo $($PSQL "ALTER TABLE games ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id)" )
echo $($PSQL "ALTER TABLE games ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id)" )

$PSQL "TRUNCATE TABLE games, teams"
X=1
OLD_IFS=$IFS
IFS=","

while read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if (( $X == 1 ))
  then
    X=$(( $X + 1 ))
  else
    IFS=$OLD_IFS
    
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ ! $WINNER_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER')"
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      echo $WINNER_ID
    fi
    if [[ ! $OPPONENT_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')"
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      echo $OPPONENT_ID
    fi
    
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')"
    IFS=","
  fi
done < games.csv