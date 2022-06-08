## Toy Robot App

This challenge is to simulate a toy robot moving on a 5x5 square board, the robot can move around the surface of the board, but cannot fall off the edge.

## Instructions

To run the Toy Robot App, first generate a CSV file in the following format:

ACTION,X,Y,F
PLACE,0,0,NORTH
MOVE
REPORT

Next run the following command: `ruby -r "./lib/toy_robot_app.rb" -e "ToyRobotApp.call './data/test-data-1.csv'"` replacing `./data/test-data-1.csv` with the location of your CSV file.

## Considerations

The plan to refactor this was to start using the command pattern to do the actions (PLACE, LEFT, RIGHT, MOVE, REPORT), move the logic to get the direction out of the Robot class and into the place command and finally read the sequence of actions from the data file, instantiate commands based on them, place the commands into a queue and execute them in order.