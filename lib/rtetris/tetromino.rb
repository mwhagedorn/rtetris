# frozen_string_literal: true

##
#  This class represents a Tetris shape, and the shape is determined by the passed array of integers
module Rtetris
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

    # @return [int] an array of the lowest y values per colunn in the piece
    def skirt
      the_result = Array.new(self.width, 100)
      (0..width - 1).each do |col|
        (0..height - 1).each do |row|
          if @body_data[row][col] == 1
            if the_result[col] == 100
              the_result[col] = row
              break
            end
          end
        end
      end
      the_result
    end

    # The Square or Q shape
    # 1 1
    # 1 1
    # @return Tetromino
    def self.Q
      data = [[1, 1], [1, 1]]
      tag = 'Q'
      Tetromino.new(data, tag)
    end

    # The T shape
    # 0 1 0
    # 1 1 1
    # @return Tetromino
    def self.T
      data = [[0, 1, 0], [1, 1, 1]]
      tag = 'T'
      Tetromino.new(data, tag)
    end

    # The I shape
    # 1
    # 15
    # 1
    # 1
    # @return Tetromino
    def self.I
      data = [[1, 1, 1, 1]]
      tag = 'I'
      Tetromino.new(data, tag)
    end

    # The L shape
    # 0 1
    # 0 1
    # 1 1
    # @return Tetromino
    def self.L
      data = [[1, 1], [1, 0], [1, 0]]
      tag = 'L'
      Tetromino.new(data, tag)
    end

    # The Dog shape or D (LH)
    # 1 1 0
    # 0 1 1
    # @return Tetromino
    def self.Z
      data = [[0, 1, 1], [1, 1, 0]]
      tag = 'Z'
      Tetromino.new(data, tag)
    end

    # The Dog shape or D (LH)
    # 1 1 0
    # 0 1 1
    # @return Tetromino
    def self.S
      data = [[1, 1, 0], [0, 1, 1]]
      tag = 'S'
      Tetromino.new(data, tag)
    end

    # The J Shape
    # 0 1
    # 0 1
    # 1 1
    # @return Tetromino
    def self.J
      data = [[1, 1], [0, 1], [0, 1]]
      tag = 'J'
      Tetromino.new(data, tag)
    end
  end
end
