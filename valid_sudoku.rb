# @param {Character[][]} board
# @return {Boolean}

def valid_9?(array)
  hash = {}
  array.each do |a|
    next if a == "."
    return false if hash[a] && hash[a] > 0
    hash[a] = 1
  end
  true
end

def is_valid_sudoku(board)
  # check rows
  board.each do |r|
    return false unless valid_9?(r)
  end

  # check columns
  for i in 0..8
    col = board.map{|r| r[i]}
    return false unless valid_9?(col)
  end

  # check boxes
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
      return false unless valid_9?(box.flatten)
    end
  end
  true
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
    assert is_valid_sudoku(board)
  end

  def test_2
    board = 
    [["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    assert !is_valid_sudoku(board)
  end

  def test_3
    board = [[".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."],[".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]]
    assert !is_valid_sudoku(board), "should be false"
  end
end