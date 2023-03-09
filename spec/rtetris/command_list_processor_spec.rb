# frozen_string_literal: true

require 'rspec'
require 'rtetris/command_list_processor'
require 'rtetris/board'
require 'rtetris/tetromino'

RSpec.describe Rtetris::CommandListProcessor do
  subject do
    data = [['Q','0'], ['T','1'],['Z','4'],[],['S','3'],['L','3'],[]]
    cp = Rtetris::CommandListProcessor.new(data)
  end

  context '#process' do
    it 'returns 2 boards processed' do
      expect(subject.process).to eq(2)
    end
  end
end
