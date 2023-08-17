class Sudoku
  attr_accessor :board, :columns, :rows, :boxes

  def initialize board
    @board = board
    @rows = board
    @columns = columns
    @boxes = boxes
  end

  def columns
    puts "i'm the getter!"
    return @columns unless @columns.nil?
    puts "make columns"

    @columns = []
    for i in 0..8
      @columns << @board.map{|r| r[i]}
    end
    @columns
  end

  def boxes
    return @boxes unless @boxes.nil?

    @boxes = []
    # outer two loops are for each box
    # innter two loops are for each element within box
    for i in 0..2
      for j in 0..2
        box = []
        for k in 0..2
          for l in 0..2
            box << board[i * 3 + k][j * 3 + l]
          end
        end
        @boxes << box.flatten
      end
    end
    @boxes
  end

  def is_valid_sudoku?
    # check rows
    @rows.each do |r|
      return false unless valid_9?(r)
    end
    puts "testing columns"
    puts "#{@columns}"
  
    # check columns
    @columns.each do |c|
      return false unless valid_9?(c)
    end

    # check boxes
    @boxes.each do |b|
      puts "testing boxes"
      return false unless valid_9?(b)
    end
  end

  # TODO
  # @param {Character[][]} board
  # @return {Void} Do not return anything, modify board in-place instead.
  # def solve_sudoku(board)
  #   while board.flatten.find(".")

  #   end
  # end

  

  private

  def valid_9? array
    hash = {}
    array.each do |a|
      next if a == "."
      return false if hash[a] && hash[a] > 0
      hash[a] = 1
    end
    true
  end
end

require 'test/unit'
class MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  def test_1
    board = 
    [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    s = Sudoku.new(board)
    assert s.is_valid_sudoku?
  end

  def test_2
    board = 
    [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    s = Sudoku.new(board)
    assert !s.is_valid_sudoku?
  end

  def test_3
    board = [[".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."],[".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]]
    s = Sudoku.new(board)
    assert !s.is_valid_sudoku?
  end
end