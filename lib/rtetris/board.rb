# frozen_string_literal: true
##
# Board:  State of the tetris board
class Board
  attr_accessor :width
  attr_accessor :height
  attr_accessor :widths
  attr_accessor :heights
  attr_reader :data
  attr_accessor :max_height
  PLACE_OK = 0
  PLACE_BAD = 1
  PLACE_ROW_FILLED = 2
  DEBUG = false
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
    @data = Array.new(h) { Array.new(w) { 0 } }
    @max_height = 0
    @widths = Array.new(h) { 0 }
    @heights = Array.new(w) { 0 }
    @height = h
    @width = w
  end
  ##
  # Given a piece and a column, process the move and potentially handle clearing rows
  def process_move(piece, column)
    rc = drop_height(piece, column)
    place_code = place(piece,column,rc)
    if place_code == PLACE_ROW_FILLED
      clear_rows
    end
    place_code
  end
  ##
  #  Takes a piece and and x,y and sets the piece on the grid with origin (LL) of the piece at the x,y location
  #
  # @param [Object] piece
  # @param [Object] y
  # @param [Object] x
  # @return PLACE_OK, PLACE_ROW_FILLED
  def place(piece, x, y)
    # copy the main state to the backup before making changes
    # check for too wide, too high
    # updateGrid
    # check for full row and return ROW_FILLEDo
    ret_val = PLACE_OK

    piece.body_data.each_with_index do |row, index_r|
      row.each_with_index do |_column,index_c|
        if @data[index_r + y][index_c + x] == 1 && row[index_r][index_c] == 1
          ret_val = PLACE_BAD
          break
        end
      end
    end
    update_data(piece, x,y)
    if ret_val == PLACE_OK
      (y..y+piece.height).each do |row|
        if widths[row] == width
          return PLACE_ROW_FILLED
        end
      end
    end
    sanity_check
    ret_val
  end
  ##
  #  computes the y value where the origin (LL) of a piece will come to rest if dropped
  #  in the given column
  def drop_height(piece, column)
    #use heights array and skirt to compute y value quickly
    retval = 0
    skirt = piece.skirt
    (0...skirt.length).each do |scol|
      if heights[column + scol] - skirt[scol] > retval
        retval = heights[column + scol] - skirt[scol]
      end
    end
    retval
  end

  ##
  #  update the heights of each column (highest value in the column)
  def update_heights(startidx, endidx)
    (startidx...endidx).each do |column|
      current_height = 0
      (height-1).downto(0) do |row|
        if @data[row][column] == 1
          current_height = row + 1
          break
        end
      end
      heights[column] = current_height
    end
  end
  ##
  # For each row update how many filled squares in that row
  def update_widths(start, endval)
    (start...endval).each do |row|
      the_row = @data[row]
      new_width = the_row.sum
      widths[row] = new_width
    end
  end

  ##
  # Update the backing datastructure which represents the game board.  The result is a datagrid
  # with the piece applied to it at x,y
  #
  # @param Tetromino piece The piece used to update the data grid
  # @param int x The x coordinate of where to place the piece on the grid (i.e. the colunn)
  # @param int y The y coordinate of where to place the piece on the grid (i.e. the row)
  def update_data(piece, x, y)
    piece.body_data.each_with_index do |row, index_r|
      row.each_with_index do |column,index_c|
        if column == 1
          @data[index_r + y][index_c + x] = 1
        end
      end
    end
    update_widths(y, y+piece.height)
    update_heights(x, x+piece.width)
    if y + piece.height > @max_height
      @max_height = y + piece.height
    end
  end

  ##
  # Clear all the filled rows in the grid and drop them down
  def clear_rows
    rows_cleared = 0
    cleared = false
    (0...max_height).each do |row|
      if cleared
        # this means the previous iteration cleared rows, dropping the grid
        row-=1
      end
      cleared = true
      if @data[row].sum < width
        cleared = false
        next
      end
      if cleared
        rows_cleared+=1
        (row...max_height).each do |current_row|
          (0...width).each do |current_column|
            @data[current_row][current_column] = @data[current_row+1][current_column]
          end
          widths[current_row] = widths[current_row + 1]
        end
        @data[max_height-1] = Array.new(width) { 0 }
        widths[max_height-1] = 0
        #row-=1
        @max_height-=1
      end
    end
    update_heights(0, width)
    sanity_check
    rows_cleared

  end

  def sanity_check
    if DEBUG
      (0...width).each do |colidx|
        if heights[colidx] > max_height || heights[colidx] > height
          puts("Check column height at #{colidx}")
        end
      end
      (0...height).each do |rowidx|
        if widths[rowidx] > width
          puts("Check row width at #{rowidx}")
        end

      end
      puts(self.to_s)
      puts("Width: #{width} Height: #{height} MaxHeight: #{max_height}")
      puts("")
    end
  end

  def to_s
    (height-1).downto(0).each do |row|
      print("|")
      (0...width).each do |col|
        if @data[row][col] == 1
          print("+")
        else
          print(" ")
        end
      end
      print("|\n")
    end
    (0...width+2).each do |_col|
      print("-")
    end
    " "
  end

end
