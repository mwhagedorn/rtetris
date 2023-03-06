# frozen_string_literal: true

require 'rspec'
require 'rtetris/tetromino'

RSpec.describe Tetromino do
  context 'when the body data is T' do
    subject do
      data = [[1,1,1], [0,1,0]]
      tag = 'T'
      Tetromino.new(data, tag)
    end

    it 'has a width of 3' do
      expect(subject.width).to eq(3)
    end
    it 'has a height of 2' do
      expect(subject.height).to eq(2)
    end
    it 'has a tag of "T"' do
      expect(subject.tag).to eq('T')
    end
  end

  context 'when the body data is Q' do
    subject do
      data = [[1,1], [1,1]]
      tag = 'Q'
      Tetromino.new(data, tag)
    end

    it 'has a width of 2' do
      expect(subject.width).to eq(2)
    end
    it 'has a height of 2' do
      expect(subject.height).to eq(2)
    end
    it 'has a tag of "Q"' do
      expect(subject.tag).to eq('Q')
    end
  end
end
