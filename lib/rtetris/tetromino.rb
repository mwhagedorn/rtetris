# frozen_string_literal: true

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




end
