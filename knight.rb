class Knight
  require './board.rb'
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  # use bfs to find all routes from 'from' to 'to'
  def knight_moves(from = [0, 0], to)
    queue = [ @board.board[from] ]
    visited = []
    until queue.empty?
      position = queue.shift
      break if position.root == to
      visited << position
      position.possible_moves.each { |node| visited << @board.board[node] unless visited.include?(@board.board[node]) }
    end
    show_path(find_path(to, visited))
  end

  # given the endpoint and visited paths, search through visited paths and keep backtracking until you get to the end of the array
  def find_path(to, visited_moves)
    target = to
    path = [ to ]
    visited_moves.reverse.each do |nodes|
      nodes.possible_moves.each do |move|
        if move == target
          path << nodes.root
          target = nodes.root
        end
      end
    end
    path.reverse
  end

  # given the discovered shortest path, output a message with number of moves and path
  def show_path(path)
    str = "You made it in #{path.size} moves! Here's your path: \n"
    path.each { |point| str += "#{point} \n"}
    puts str
  end

end
