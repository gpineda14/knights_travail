class Node
  attr_accessor :root, :possible_moves
  def initialize(root, possible_moves = nil)
    @root = root
    @possible_moves = possible_moves
  end
end
