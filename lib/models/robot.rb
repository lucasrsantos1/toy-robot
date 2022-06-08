# frozen_string_literal: true

require_relative '../representers/robot_reporter'
require_relative './directions/direction'
require_relative './null_board'

class Robot
  attr_reader :board, :x, :y, :direction

  def initialize(board: NullBoard.new, overrides: {})
    @board = board
    @x = nil
    @y = nil
    @direction = nil
    @reporter = overrides.fetch(:reporter) { RobotReporter }
  end

  def place(x:, y:, direction:)
    return unless board.valid_position?(x: x, y: y)

    move_position(obj: self, x: x, y: y, direction: get_direction(direction))
  end

  def move
    return unless is_placed?

    x_coord, y_coord = direction.move(x: x, y: y)

    move_position(obj: self, x: x_coord, y: y_coord, direction: direction)
  end

  def left
    return unless is_placed?

    @direction = direction.left
  end

  def right
    return unless is_placed?

    @direction = direction.right
  end

  def report
    return unless is_placed?

    @reporter.new(x: x, y: y, direction: direction).report
  end

  private

  attr_writer :x, :y, :direction

  def move_position(obj:, x:, y:, direction:)
    if board.occupy(obj: obj, x: x, y: y)
      @x = x
      @y = y
      @direction = direction
    end
  end

  def is_placed?
    return false unless @x && @y && @direction

    true
  end

  def get_direction(direction)
    Directions::Direction.class_for(direction)
  end
end
