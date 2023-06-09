# frozen_string_literal: true

require 'rspec'
require 'rtetris/board'
require 'rtetris/tetromino'

RSpec.describe Rtetris::Board do
  context 'After adding a Q' do
    subject(:qboard) do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.Q
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(2)
      expect(subject.heights[1]).to eq(2)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(2)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(2)
      expect(subject.widths[1]).to eq(2)
      expect(subject.widths[2]).to eq(0)
    end
    context "and filling the row with I" do
      it "returns row filled constant" do
        piece = Rtetris::Tetromino.I
        rc = qboard.place(piece, 2, 0)
        expect(rc).to eql(Rtetris::Board::PLACE_ROW_FILLED)
      end
    end
  end
  context 'After adding a Z' do
    subject do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.Z
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(2)
      expect(subject.heights[1]).to eq(2)
      expect(subject.heights[2]).to eq(1)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(2)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(2)
      expect(subject.widths[1]).to eq(2)
      expect(subject.widths[2]).to eq(0)
    end
  end
  context 'After adding a S' do
    subject do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.S
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(1)
      expect(subject.heights[1]).to eq(2)
      expect(subject.heights[2]).to eq(2)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(2)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(2)
      expect(subject.widths[1]).to eq(2)
      expect(subject.widths[2]).to eq(0)
    end
  end
  context 'After adding a T' do
    subject do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.T
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(2)
      expect(subject.heights[1]).to eq(2)
      expect(subject.heights[2]).to eq(2)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(2)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(1)
      expect(subject.widths[1]).to eq(3)
      expect(subject.widths[2]).to eq(0)
    end
  end
  context 'After adding a I' do
    subject do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.I
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(1)
      expect(subject.heights[1]).to eq(1)
      expect(subject.heights[2]).to eq(1)
      expect(subject.heights[2]).to eq(1)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(1)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(4)
      expect(subject.widths[1]).to eq(0)
    end
  end
  context 'After adding an L' do
    subject do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.L
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(3)
      expect(subject.heights[1]).to eq(1)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(3)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(2)
      expect(subject.widths[1]).to eq(1)
      expect(subject.widths[2]).to eq(1)
    end
  end
  context 'After adding an J' do
    subject(:jboard) do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.J
      board.place(piece, 0,0)
      board
    end
    it 'has a correct heights array' do
      expect(subject.heights[0]).to eq(1)
      expect(subject.heights[1]).to eq(3)
    end
    it 'has the correct max height' do
      expect(subject.max_height).to eq(3)
    end
    it 'has the correct widths array' do
      expect(subject.widths[0]).to eq(2)
      expect(subject.widths[1]).to eq(1)
      expect(subject.widths[2]).to eq(1)
    end
    context "and then adding a Q overlapping" do
      it "detects the overlap" do
        second_piece = Rtetris::Tetromino.Q
        rc = jboard.place(second_piece, 0, 0)
        expect(rc).to eq(Rtetris::Board::PLACE_BAD)
      end
    end
  end
  context '#clear_rows after Q and I' do
    subject(:qboard) do
      board = Rtetris::Board.new(3,6)
      piece = Rtetris::Tetromino.Q
      board.place(piece, 0,0)
      piece = Rtetris::Tetromino.I
      board.place(piece, 2, 0)
      board
    end
    it "should return 1 as maxheight" do
      rc = subject.clear_rows()
      expect(rc).to eq(1)
      expect(subject.data[0][0]).to eq(1)
      expect(subject.data[0][1]).to eq(1)
      expect(subject.data[0][2]).to eq(0)
      expect(subject.data[0])
    end

  end
  context "T1, Z3, I4" do
    subject(:qboard) do
      board = Rtetris::Board.new(5,8)
      piece = Rtetris::Tetromino.T
      board.place(piece,1,0)
      piece = Rtetris::Tetromino.Z
      board.place(piece, 3, 1)
      piece = Rtetris::Tetromino.I
      board.place(piece, 4, 3)
      board
    end

    it "the maxheight should be 4" do
      expect(subject.data[0][2]).to eq(1)
      expect(subject.data[1][1]).to eq(1)
      expect(subject.data[1][2]).to eq(1)
      expect(subject.data[1][3]).to eq(1)
      expect(subject.data[1][4]).to eq(1)
      expect(subject.data[1][5]).to eq(1)
      expect(subject.data[2][3]).to eq(1)
      expect(subject.data[2][4]).to eq(1)
      expect(subject.data[3][4]).to eq(1)
      expect(subject.data[3][5]).to eq(1)
      expect(subject.data[3][6]).to eq(1)
      expect(subject.data[3][7]).to eq(1)
      expect(subject.widths).to eq([1,5,2,4,0])
      expect(subject.heights).to eq([0,2,2,3,4,4,4,4])
      expect(subject.max_height).to eq(4)
    end
  end
  context "#drop_height for T1" do
    subject(:qboard) do
      board = Rtetris::Board.new(5,8)
      piece = Rtetris::Tetromino.T
      board.drop_height(piece, 1)
    end

    it "the y value should be 0" do
      expect(subject).to eq(0)
    end
  end

  context "#drop_height for T1,Z3" do
    subject(:qboard) do
      board = Rtetris::Board.new(5,8)
      piece = Rtetris::Tetromino.T
      rc = board.drop_height(piece, 1)
      board.place(piece,1,rc)
      piece = Rtetris::Tetromino.Z
      rc = board.drop_height(piece, 3)
    end

    it "the y value should be 0" do
      expect(subject).to eq(1)
    end
  end

  context "#drop_height for T1,Z3,I4" do
    subject(:qboard) do
      board = Rtetris::Board.new(5,8)
      piece = Rtetris::Tetromino.T
      rc = board.drop_height(piece, 1)
      board.place(piece,1,rc)
      piece = Rtetris::Tetromino.Z
      rc = board.drop_height(piece, 3)
      board.place(piece,3,rc)
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 4)
    end

    it "the y value should be 0" do
      expect(subject).to eq(3)
    end
  end

  context "Q0,I2,I6,I0,I6,I6,Q2,Q4" do
    subject do
      board = Rtetris::Board.new(10,10)
      piece = Rtetris::Tetromino.Q
      rc = board.drop_height(piece, 0)
      board.place(piece,0,rc)
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 2)
      board.place(piece,2,rc)
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 6)
      clear_sig = board.place(piece,6,rc)
      board.clear_rows
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 0)
      board.place(piece,0,rc)
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 6)
      board.place(piece,6,rc)
      piece = Rtetris::Tetromino.I
      rc = board.drop_height(piece, 6)
      board.place(piece,6,rc)
      piece = Rtetris::Tetromino.Q
      rc = board.drop_height(piece, 2)
      clear_rc = board.place(piece,2,rc)
      piece = Rtetris::Tetromino.Q
      rc = board.drop_height(piece, 4)
      clear_rc2 = board.place(piece,4,rc)
      board.clear_rows
      board
    end

    it "the max height is 3 " do
      expect(subject.max_height).to eq(3)
    end
  end

  context "Q0, I2, I6, I0, I6, I6, Q2, Q4" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.Q
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 2)
      p3 = Rtetris::Tetromino.I
      board.process_move(p3, 6)
      p4 = Rtetris::Tetromino.I
      board.process_move(p4, 0)
      p5 = Rtetris::Tetromino.I
      board.process_move(p5, 6)
      p6 = Rtetris::Tetromino.I
      board.process_move(p6, 6)
      p7 = Rtetris::Tetromino.Q
      board.process_move(p7,2)
      p8 = Rtetris::Tetromino.Q
      board.process_move(p8,4)
      board
    end

    it "the max height is 3" do
      expect(subject.max_height).to eq(3)
    end
  end

  context "L0, J3, L5, J8, T1, T6, S2, Z5, T0, T7" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.L
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.J
      board.process_move(p2, 3)
      p3 = Rtetris::Tetromino.L
      board.process_move(p3, 5)
      p4 = Rtetris::Tetromino.J
      board.process_move(p4, 8)
      p5 = Rtetris::Tetromino.T
      board.process_move(p5, 1)
      p6 = Rtetris::Tetromino.T
      board.process_move(p6, 6)
      p7 = Rtetris::Tetromino.S
      board.process_move(p7,2)
      p8 = Rtetris::Tetromino.Z
      board.process_move(p8,5)
      p8 = Rtetris::Tetromino.T
      board.process_move(p8,0)
      p8 = Rtetris::Tetromino.T
      board.process_move(p8,7)
      board
    end

    it "the max height is 0" do
      expect(subject.max_height).to eq(0)
    end
  end

  context "S0,S2,S4,S5,Q8,Q8,Q8,Q8,T1,Q1,I0,Q4" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.S
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.S
      board.process_move(p2, 2)
      p3 = Rtetris::Tetromino.S
      board.process_move(p3, 4)
      p4 = Rtetris::Tetromino.S
      board.process_move(p4, 5)
      p5 = Rtetris::Tetromino.Q
      board.process_move(p5, 8)
      p6 = Rtetris::Tetromino.Q
      board.process_move(p6, 8)
      p7 = Rtetris::Tetromino.Q
      board.process_move(p7,8)
      p8 = Rtetris::Tetromino.T
      board.process_move(p8,1)
      p8 = Rtetris::Tetromino.Q
      board.process_move(p8,1)
      p8 = Rtetris::Tetromino.I
      board.process_move(p8,0)
      p8 = Rtetris::Tetromino.Q
      board.process_move(p8,4)
      board
    end
    it "should return 9" do
      expect(subject.max_height).to eq(9)
    end
  end

  context "S0,S2,S4,S6" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.S
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.S
      board.process_move(p2, 2)
      p3 = Rtetris::Tetromino.S
      board.process_move(p3, 4)
      p4 = Rtetris::Tetromino.S
      board.process_move(p4, 6)
      board
    end

    it "should have a max_height of 8" do
      expect(subject.max_height).to eq(8)
    end
  end
  context "L0,J3,L5,J8,T1,T6,J2,L6,T0,T7,Q4" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.L
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.J
      board.process_move(p2, 3)
      p3 = Rtetris::Tetromino.L
      board.process_move(p3, 5)
      p4 = Rtetris::Tetromino.J
      board.process_move(p4, 8)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 1)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 6)
      p4 = Rtetris::Tetromino.J
      board.process_move(p4, 2)
      p4 = Rtetris::Tetromino.L
      board.process_move(p4, 6)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 0)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 7)
      p4 = Rtetris::Tetromino.Q
      board.process_move(p4, 4)
      board

    end
    it "should have a max_height of 1" do
      expect(subject.max_height).to eq(1)
    end

  end

  context "L0,J3,L5,J8,T1,T6" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.L
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.J
      board.process_move(p2, 3)
      p3 = Rtetris::Tetromino.L
      board.process_move(p3, 5)
      p4 = Rtetris::Tetromino.J
      board.process_move(p4, 8)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 1)
      p4 = Rtetris::Tetromino.T
      board.process_move(p4, 6)
      board
    end
    it "should have max height of 1" do
      expect(subject.max_height).to eq(1)
    end
  end

  context "T0,T3,I6,I6" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.T
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.T
      board.process_move(p2, 3)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 6)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 6)
      board
    end
    it "should have max height of 1" do
      expect(subject.max_height).to eq(1)
    end
  end

  context "I0,I4,Q8,I0,I4" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.I
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 4)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 8)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 0)
      p2 = Rtetris::Tetromino.I
      board.process_move(p2, 4)
      board
    end
    it "should have max height of 0" do
      expect(subject.max_height).to eq(0)
    end
  end

  context "Q0,Q2,Q4,Q6,Q8,Q1,Q1" do
    subject do
      board = Rtetris::Board.new(25, 10)
      p1 = Rtetris::Tetromino.Q
      board.process_move(p1, 0)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 2)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 4)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 6)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 8)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 1)
      p2 = Rtetris::Tetromino.Q
      board.process_move(p2, 1)
      board
    end
    it "should have max height of 2" do
      expect(subject.max_height).to eq(4)
    end
  end




end
