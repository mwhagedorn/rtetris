# frozen_string_literal: true

module Rtetris
  class Launcher
    self.execute do
      # file -> parser -> command_list_processor -> board
      data_buffer = []
      ARGF.each_line do |line
        data_buffer << line
      end
      puts(data_buffer)
    end
  end
end

