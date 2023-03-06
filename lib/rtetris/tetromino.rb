# frozen_string_literal: true

##
#  This class represents a Tetris shape, and the shape is determined by the passed array of integers

class Tetromino

  attr_accessor :current_x
  attr_accessor :current_y
  attr_reader :width
  attr_reader :height
  attr_reader :body_data
  attr_reader :tag

  # @param [Object] bodydata integer flag array to indicate the shape
  # @param String tag the handle for this tetromino (square, L etc)
  def initialize (bodydata, tag)
    @body_data = bodydata
    @tag = tag
    @width = bodydata[0].length
    @height = bodydata.length
    @current_x = 0
    @current_y = 0
  end
  # The Square or Q shape
  # 1 1
  # 1 1
  # @return Tetromino
  def self.Q
    data = [[1,1], [1,1]]
    tag = 'Q'
    Tetromino.new(data, tag)
  end

  # The T shape
  # 0 1 0
  # 1 1 1
  # @return Tetromino
  def self.T
    data = [[1,1,1], [0,1,0]]
    tag = 'T'
    Tetromino.new(data, tag)
  end
  # The I shape
  # 1
  # 1
  # 1
  # 1
  # @return Tetromino
  def self.I
    data = [[0],[1],[2],[3]]
    tag = 'I'
    Tetromino.new(data, tag)
  end

  # The L shape
  # 0 1
  # 0 1
  # 1 1
  # @return Tetromino
  def self.L
    data = [[1,1],[0,1],[0,1]]
    tag = 'L'
    Tetromino.new(data, tag)
  end

  # The Dog shape or D (LH)
  # 1 1 0
  # 0 1 1
  # @return Tetromino
  def self.D
    data = [[0,1,1],[1,1,0]]
    tag = 'D'
    Tetromino.new(data, tag)
  end



end
