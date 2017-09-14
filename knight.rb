class Knight
  require './board.rb'
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def knight_moves(from = [0, 0], to)
    queue = [ @board.board[from] ]
    visited = []
    until queue.empty?
      position = queue.shift
      break if position.root == to
      visited << position
      position.possible_moves.each { |node| visited << @board.board[node] if !visited.include?(@board.board[node]) }
    end
    show_path(find_path(to, visited))
  end

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

  def show_path(path)
    str = "You made it in #{path.size} moves! Here's your path: \n"
    path.each { |point| str += "#{point} \n"}
    puts str
  end

end
