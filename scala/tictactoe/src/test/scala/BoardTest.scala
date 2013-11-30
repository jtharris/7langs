package tictactoe

import org.scalatest.{Matchers, FlatSpec}

class BoardTest extends FlatSpec with Matchers {

  it should "create an empty board with no winner" in {
    val board = new Board()

    board.hasWinner should be(false)
  }

  it should "detect no winner when only one play has been made" in {
    val board = new Board()

    board.spaces(0)(2) = 'X'

    board.hasWinner should be(false)
  }

  it should "detect a winner when there are all Xs on the top row" in {
    var board = new Board()

    board.spaces(0)(0) = 'X'
    board.spaces(0)(1) = 'X'
    board.spaces(0)(2) = 'X'

    board.hasWinner should be(true)
    board.winner should be('X')
  }

  it should "detect a winner when there are all Os on the right column" in {
    var board = new Board()

    board.spaces(0)(2) = 'O'
    board.spaces(1)(2) = 'O'
    board.spaces(2)(2) = 'O'

    board.hasWinner should be(true)
    board.winner should be('O')
  }

  it should "detect a winner when there are all Xs down the first diagonal" in {
    var board = new Board()

    board.spaces(0)(0) = 'X'
    board.spaces(1)(1) = 'X'
    board.spaces(2)(2) = 'X'

    board.hasWinner should be(true)
    board.winner should be('X')
  }

  it should "detect a winner when there are all Os down the second diagonal" in {
    var board = new Board()

    board.spaces(2)(0) = 'O'
    board.spaces(1)(1) = 'O'
    board.spaces(0)(2) = 'O'

    board.hasWinner should be(true)
    board.winner should be('O')
  }

}
