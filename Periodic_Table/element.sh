#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

INPUT=$1

MAIN_MENU() {
  if [[ -z $INPUT ]]
  then
    echo "Please provide an element as an argument."
  else
    if [[ ! $INPUT =~ ^[0-9]+$ ]]
      #find atomic number
      then
        if [[ ! $INPUT =~ ^[a-zA-Z]{1,2}?$ ]]
          then
            ATOMIC_NUMBER_VAR=$($PSQL "SELECT atomic_number FROM elements WHERE name='$INPUT'")
          else
            ATOMIC_NUMBER_VAR=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT'")
        fi
      else
      ATOMIC_NUMBER_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$INPUT")
    fi

    #define atomic number

    if [[ -z $ATOMIC_NUMBER_VAR ]]
      then
        ATOMIC_NUMBER=$ATOMIC_NUMBER_NUM
      else 
        ATOMIC_NUMBER=$ATOMIC_NUMBER_VAR
    fi

    if [[ -z $ATOMIC_NUMBER ]]
      then
        echo "I could not find that element in the database."
      else
    
        # define necessary variables
        NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
        TYPE=$($PSQL "SELECT type FROM types JOIN properties ON types.type_id=properties.type_id WHERE atomic_number=$ATOMIC_NUMBER")
        MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
        MELTING_PT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
        BOILING_PT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

        # format necessary variables (get rid of leading spaces)
        ATOMIC_NUMBER=$(echo $ATOMIC_NUMBER | sed 's/ //g')
        ATOMIC_NAME=$(echo $NAME | sed 's/ //g')
        ATOMIC_SYMBOL=$(echo $SYMBOL | sed 's/ //g')
        ATOMIC_TYPE=$(echo $TYPE | sed 's/ //g')
        ATOMIC_MASS=$(echo $MASS | sed 's/ //g')
        ATOMIC_MELTING=$(echo $MELTING_PT | sed 's/ //g')
        ATOMIC_BOILING=$(echo $BOILING_PT | sed 's/ //g')

        echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $ATOMIC_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $ATOMIC_MELTING celsius and a boiling point of $ATOMIC_BOILING celsius."
    fi
  fi
  #finished
}

MAIN_MENU