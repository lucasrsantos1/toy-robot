# frozen_string_literal: true

class RobotReporter
  def initialize(x:, y:, direction:)
    @x = x
    @y = y
    @direction = direction
  end

  def report
    puts "#{x}, #{y}, #{direction.to_s}"
  end

  private

  attr_reader :x, :y, :direction
end
