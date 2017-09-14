class Board
  require './node.rb'
  attr_accessor :board
  def initialize
    @board = {}
    set_board
  end

  def set_board
    graph = set_coordinates
    graph.each { |coordinate| @board[coordinate] = Node.new(coordinate, possible_moves(coordinate)) }
  end

  def set_coordinates
    graph = []
    for i in 0..7
      for j in 0..7
        graph << [i, j]
      end
    end
    graph
  end

  def possible_moves(position)
    newMoves = []
    offsets = [[1, 2], [2, 1], [-1, 2], [-2, 1], [2, -1], [1, -2], [-2, -1], [-1, -2]]
    for i in offsets
      x = position[0] + i[0]
      y = position[1] + i[1]
      if legal_move?(x) && legal_move?(y)
        newMoves << [x, y]
      end
    end
    newMoves
  end

  def legal_move?(coordinate)
    return coordinate >= 0 && coordinate <= 7 ? true : false
  end

end
