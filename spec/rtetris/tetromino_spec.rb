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

  context 'when the body data is I' do
    subject do
      data = [[0],[1],[2],[3]]
      tag = 'I'
      Tetromino.new(data, tag)
    end

    it 'has a width of 1' do
      expect(subject.width).to eq(1)
    end
    it 'has a height of 4' do
      expect(subject.height).to eq(4)
    end
    it 'has a tag of "I"' do
      expect(subject.tag).to eq('I')
    end
  end

  context 'when the body data is L' do
    subject do
      data = [[1,1],[0,1],[0,1]]
      tag = 'L'
      Tetromino.new(data, tag)
    end

    it 'has a width of 2' do
      expect(subject.width).to eq(2)
    end
    it 'has a height of 3' do
      expect(subject.height).to eq(3)
    end
    it 'has a tag of "L"' do
      expect(subject.tag).to eq('L')
    end
  end

  context 'when the body data is D' do
    subject do
      data = [[0,1,1],[1,1,0]]
      tag = 'D'
      Tetromino.new(data, tag)
    end

    it 'has a width of 3' do
      expect(subject.width).to eq(3)
    end
    it 'has a height of 2' do
      expect(subject.height).to eq(2)
    end
    it 'has a tag of "D"' do
      expect(subject.tag).to eq('D')
    end
  end


end
