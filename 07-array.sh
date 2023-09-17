#!/bin/bash

# this is called array, instead of single value it can hold multiple values
PERSONS=("Guna" "Santhu" "Jayanth")
# inside array we always refer values with index and it starts from 0

echo "Frist Person: ${PERSONS[0]}"

echo "All Person: ${PERSONS[@]}"