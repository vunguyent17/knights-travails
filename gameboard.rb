# frozen_string_literal: true

H_AXIS = 'abcdefgh'
V_AXIS = [1, 2, 3, 4, 5, 6, 7, 8].freeze

require_relative 'node'

class GameBoard
  def initialize
    matrix = Array.new(8) { Array.new(8) }
    (0..7).each do |x|
      (0..7).each do |y|
        matrix[x][y] = Node.new([x, y], V_AXIS[x].to_s + H_AXIS[y])
      end
    end
    @knight_allboard = matrix
  end

  def get_node(loc)
    @knight_allboard[loc[0]][loc[1]]
  end
end
