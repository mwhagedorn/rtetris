# frozen_string_literal: true

##
# Takes in a list of commands which are arrays of [PieceName, Col], and evaluates the state of the board when it encounters
# an empty array in the list, it also creates a new board at this time

module Rtetris
  class CommandListProcessor
    def initialize(command_list)
      @commands = command_list
      @sets = 0
    end

    ##
    # Returns the number of boards processed
    def process
      the_board = new_board
      @commands.each do |command|
        if command.empty?
          puts(the_board.max_height)
          # throw away board and start over
          the_board = new_board
          @sets += 1
        else
          piece_type = command[0]
          column = command[1].to_i
          # call the factory method dynamically
          piece_object = new_piece(piece_type)
          the_board.process_move(piece_object, column)
        end
      end
      @sets
    end

    def new_board
      Board.new(100, 10)
    end

    def new_piece(type_name)
      Tetromino.send(type_name.to_sym)
    end
  end
end
