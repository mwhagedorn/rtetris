# Rtetris

A simple script to calculate the maximum height, in rows for a series of tetris moves.   Unlike the real game this engine
does not consider that pieces can be rotated.  Each move is presented by a character code in [Q,Z,S,T,I,L,J ], and a column
that the piece is to be dropped from (i.e. from the top row).   The column codes will be in [0..9].   

Each piece is represented by an array of integers, where a 1 indicates the presences of a filled block.
Pieces:
# Q
    1 1
    1 1
# T 
    0 1 0
    1 1 1
# I
    1 1 1 1
# L 
    0 1
    0 1
    1 1
# Z
    1 1 0
    0 1 1
# S
    0 1 1
    1 1 0

# J
    0 1 
    0 1 
    1 1

## Usage

Given an input file of the form of the sample file (input.txt), execute the tool by typing from a command prompt
at the root of the project 
    `./bin/tetris < INPUTFILENAME.txt > OUTPUTFILE.txt`

This will produce a single column text file with a single integer in each row, corresponding to the same row in the input 
file and showing the max height of game board for those sequence of moves.


## Development

After downloading repo,  run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
