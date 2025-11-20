#!/bin/bash
# session 20
# here same like for loop lage while loop kuda main diff is while loop files ni read cheyadiki baga use avuthundhi
# serach in google while loop cmds 

# while [ condition ]
# do
#   # Commands to be executed
# done

# Explanation:
# while [ condition ]: This initiates the while loop. The condition enclosed within the square brackets ([]) is evaluated. This condition can be a test on variables, the exit status of a command, or other expressions that evaluate to true or false.
# do: This keyword marks the beginning of the block of commands that will be executed repeatedly.
# # Commands to be executed: This represents the actual commands or statements that form the body of the loop. These commands will run as long as the condition in the while statement is true.
# done: This keyword marks the end of the while loop's command block.

count=5

echo "Starting countdown..."

while [ $count -gt 0 ] # so ikkada 5 num 0 zero kante ekkuva so loop loki velli process start avvuthudi
do
  echo "Time left: $count"
  sleep 1 # Pause for 1 second
  count=$((count - 1)) # Decrement the count
done

echo "Times up!"