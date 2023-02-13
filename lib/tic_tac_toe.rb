class TicTacToe
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def initialize
      @board = Array.new(9, " ")
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
      user_input.to_i - 1
    end

    def move(index, char)
      @board[index] = char
    end

    def position_taken?(index)
      @board[index] != " "
    end

    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
      @board.count{ |char| char != " " }
    end

    def current_player
      turn_count.even? ? "X" : "O"
    end

    def turn
      display_board
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      else
        puts "Invalid move! Please try again."
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        positions = combo.map { |index| @board[index] }
        return combo if positions.all? { |char| char == "X" }
        return combo if positions.all? { |char| char == "O" }
      end
      false
    end

    def full?
      @board.all? { |char| char != " " }
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      return "X" if won? && turn_count.even?
      return "O" if won? && turn_count.odd?
      nil
    end

    def play
      until over?
        turn
      end

      if won?
        display_board
        puts "Congratulations #{winner}!"
      elsif draw?
        display_board
        puts "Cat's Game!"
      end
    end
  end

