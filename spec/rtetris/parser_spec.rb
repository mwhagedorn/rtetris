# frozen_string_literal: true

require 'rspec'
require 'rtetris/parser'

RSpec.describe Rtetris::Parser do
  subject do
    data = ["Q0,T1,Z2,Z3\n","I0,L0,J1\n"]
    p = Rtetris::Parser.new(data)
  end

  context '#parse' do
    it 'creates a command list' do
      result = subject.parse
      expect(result.length).to eq(9)
      evaluate_markers = result.select {|arr| arr.empty?}
      expect(evaluate_markers.length).to eq(2)
      expect(result[0][0]).to eq('Q')
      expect(result[0][1]).to eq('0')
      expect(result[1][0]).to eq('T')
      expect(result[1][1]).to eq('1')
    end
  end
end
