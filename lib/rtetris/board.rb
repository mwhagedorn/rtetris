# frozen_string_literal: true
##
# Board:  State of the tetris board
class Board
  attr_accessor :width
  attr_accessor :height
  attr_accessor :widths
  attr_accessor :heights
  attr_reader :data
  ##
  # Creates a grid with lower left at 0,0.  X increases to the right and Y increasing upwards
  # Filled spots are represented by a 1, Empty by a 0
  # widths and heights arrays are to make operations more efficient.
  # Widths stores how many filled spots are in each row
  # Heights stores how many filled sports are in each column.  Height will be the index of the open which is just above
  # the tope filled spot in each column
  #
  # @param int w  : width of the boa
  # @param int h  : height of the board
  #
  def initialize (h, w)
    Array.new(h) { Array.new(w) { 0 } }
  end
  ##
  #  Takes a piece and and x,y and sets the piece on the grid with origin (LL) of the piece at the x,y location
  #
  # @param [Object] piece
  # @param [Object] y
  # @param [Object] x
  # @return PLACE_OK, PLACE_ROW_FILLED, PLACE_OUT_BOUNDS, PLACE_BAD
  def place(piece, x, y)
    # copy the main state to the backup before making changes

    @x = x
  end

  ##
  #  Delete each row that is filled all the way across, causing things to shift down
  def clear_rows
    # copy the main state to the backup before making changes
    #heights row will need to be recalced
  end

  ##
  #  computes the y value where the origin (LL) of a piece will come to rest if dropped
  #  in the given column
  def drop_height(piece, column)
    #use height and skirt to compute y value quickly

  end

  ##
  #  Saves the current state in
  def commit

  end

  # takes board state back to previously committed state
  def rollback

  end

  ##
  # Restore the main state from the backup
  def undo
    # deep copy of array copy_of_your_array = Marshal.load(Marshal.dump(your_array))
  end



end
