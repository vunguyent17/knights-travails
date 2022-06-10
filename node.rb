# frozen_string_literal: true

class Node
  attr_accessor :current_loc, :name

  def initialize(loc, name)
    @current_loc = loc
    @name = name
  end

  def location?(loc)
    @current_loc[0] == loc[0] && @current_loc[1] == loc[1]
  end
end
