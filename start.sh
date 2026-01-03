#!/bin/bash

export DB_URL=jdbc:mysql://localhost:3306/sample
export DB_USER=admin
export DB_PASSWORD=admin
export APP_PORT=8000
export PROFILE=prod

FILE="./target/contactmanager-0.0.1-SNAPSHOT.jar"

if [ -z "$1" ]; then
    echo "Starting.............."
    if [ -f "$FILE" ]; then
        echo "File $FILE exists."
    else
        ./mvnw package
    fi
    java -jar "$FILE"
elif [[ "$1" == "clean" ]]; then
    ./mvnw clean
elif [[ "$1" == "package" ]]; then
    ./mvnw package
else
    echo "Invalid Aggument Use: clean or package as argument"
fi
echo "Stopping..................... "
