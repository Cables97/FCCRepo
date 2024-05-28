#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDNUM="$[ $RANDOM % 1000 + 1 ]"
GUESS_COUNT=0
GAME_START(){
  #intro
  echo -e "Enter your username:"
  #find user
  read USERNAME
  USER_CHECK=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
  #if user doesnt exist
  if [[ -z $USER_CHECK ]]
    then
      USER_ADD=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$USERNAME', 0, 0)")
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      echo "Guess the secret number between 1 and 1000:"
      GAME_LOOP
    else
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      echo "Guess the secret number between 1 and 1000:"
      GAME_LOOP
  fi
}
#main game loop
GAME_LOOP(){
  read NUMGUESS
  GUESS_COUNT=$((GUESS_COUNT + 1))
  if [[ ! $NUMGUESS =~ ^[0-9]+$ ]]
    #if not an int
    then
      echo "That is not an integer, guess again:"
      GAME_LOOP
    else
      if [[ $NUMGUESS -eq $RANDNUM ]]
      #if you guess the right number send to game_post
        then
          GAME_POST
        else
          if [[ $NUMGUESS -lt $RANDNUM ]]
            #if NUMGUESS is less than RANDNUM
            then
              echo "It's higher than that, guess again:"
              GAME_LOOP
            else 
              echo "It's lower than that, guess again:"
              GAME_LOOP
          fi
      fi
  fi
}
GAME_POST(){
  echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDNUM. Nice job!"
  #set best game
  GAME_COMPARE=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ $GAME_COMPARE -lt $GUESS_COUNT ]]
      then
      UPDATE_GUESS_COUNT=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT WHERE username='$USERNAME'")
  fi
  #set Games Played
  HAS_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  if [[ -x $HAS_PLAYED ]]
    #if hasn't played beforr
    then
      NEW_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=1 WHERE username='$USERNAME'")
    else
    PLAY_COUNT_ADD=$(($HAS_PLAYED + 1))
      SET_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$PLAY_COUNT_ADD WHERE username='$USERNAME'")
  fi
}
GAME_START