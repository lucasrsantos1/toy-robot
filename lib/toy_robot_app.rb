require_relative './models/board'
require_relative './models/robot'
require 'csv'

class ToyRobotApp
  AVAILABLE_ACTIONS = ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"]

  def self.call(test_data_file)
    board = Board.new(size: 6)
    robot = create_robot(board)
    csv_data = CSV.parse(File.read(test_data_file), headers: true)
    csv_data.each do |row|
      action = row["ACTION"]

      next unless AVAILABLE_ACTIONS.include?(action)
      x = row["X"].to_i
      y = row["Y"].to_i
      f = row["F"]
      process_action(robot, action, x, y, f)
    end
  end

  private

  def self.create_robot(board)
    Robot.new(board: board)
  end

  def self.process_action(robot, action, x, y, f)
    if action == "PLACE"
      robot.place(x: x, y: y, direction: f)
    else
      robot.send(action.downcase)
    end
  end
end
