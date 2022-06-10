# frozen_string_literal: true

arr1 = [-2, 2]
arr2 = [-1, 1]
MOVE_OPTION = arr1.product(arr2) + arr2.product(arr1)

require_relative 'node'

require_relative 'gameboard'

class Knights
  def initialize(from, to)
    @gameboard = GameBoard.new
    @from = from
    @to = to
    @paths = []
    @paths.push([@gameboard.get_node(@from)])
    @result_paths = []
  end

  def add_node_to_path
    new_paths = []
    @paths.each do |path|
      current_loc = path[-1].current_loc
      next_moves_raw = MOVE_OPTION.map { |move| [move[0] + current_loc[0], move[1] + current_loc[1]] }
      next_moves = next_moves_raw.select do |next_move|
        (0..7).include?(next_move[0]) && (0..7).include?(next_move[1]) && !path.map(&:current_loc).include?(next_move)
      end
      next_moves.each do |next_move|
        new_path = path + [@gameboard.get_node(next_move)]
        @result_paths.push(new_path) if next_move == @to
        new_paths.push(new_path)
      end
    end
    @paths = new_paths
  end

  def moves
    add_node_to_path while @result_paths == []
    puts "Path found: #{@result_paths.length}"
    @result_paths.each do |path|
      print_path = path.map(&:current_loc)
      p print_path
    end
  end
end
