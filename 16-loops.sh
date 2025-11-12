#!/bin/bash
# Iterating from 1 to 5 (inclusive) with a step of 1
for i in {1..5}; do
  echo "Iteration $i"
done

# Iterating from 1 to 5 with a step of 2
for i in {1..5..2}; do
  echo "Iteration $i"
done
for variable_name in item1 item2 item3; do
  # Commands to execute for each item
  echo "Current item: $variable_name"
done
for ((i=1; i<=5; i++)); do
  echo "Count: $i"
done