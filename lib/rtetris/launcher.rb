# frozen_string_literal: true

require_relative("./parser")
require_relative("./command_list_processor")

module Rtetris
  class Launcher
    def self.execute
      # file -> parser -> command_list_processor -> board
      data_buffer = []
      ARGF.each_line do |line|
        data_buffer << line
      end
      parser = Parser.new(data_buffer)
      commands = parser.parse
      clp = CommandListProcessor.new(commands)
      clp.process
    end
  end
end

