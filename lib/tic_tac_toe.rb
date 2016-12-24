class TicTacToe

  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (input)
  index = input.to_i - 1
end

def move (index, token="X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  count=0
  @board.each do |index|
    if index == "X" || index == "O"
      count += 1
    end
  end
  return count
end

def current_player
  if turn_count % 2 == 0
    return "X"
  end
  return "O"
end

def turn
  puts "Enter a position between 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def full?
  if @board.detect{|i| i==" "}
    return false
  else
    return true
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
    end
  end
  return false
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if won?
    @board[won?[0]]
  else
    return nil
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end



end
