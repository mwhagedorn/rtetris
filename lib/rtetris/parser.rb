# frozen_string_literal: true
##
# Takes in an array of CSV, returns an array of commands
module Rtetris
  class Parser

    # @param [Object] data -> Q0,T1,Z1\nS1,S2\n
    def initialize(data)
      @data = data
    end

    ##
    # Creates a list of commands of the form [<SHAPE>, Col]
    # if an entry is an empty array it means evaluate the list of commands
    def parse
      commands = []
      @data.each_line do |line|
        line.strip.split(",").each do |token|
          # each token is like Q0
          commands << [token.chr, token[-1]]
        end
        commands << []
      end
      commands
    end
  end
end