package tictactoe

class Board {

  val spaces = Seq(
    Array(' ', ' ', ' '),
    Array(' ', ' ', ' '),
    Array(' ', ' ', ' ')
  )

  def hasWinner(): Boolean = {
    winner != ' '
  }

  def winner(): Char = {
    // Detect all the various ways to win
    for (player <- Seq('X', 'O')) {
      val winner = Array(player, player, player).deep

      // Check the horizontals
      for (row <- 0 to 2) {
        // .deep is for deep comparisons of arrays
        if (spaces(row).deep == winner) {
          return player
        }
      }

      // Check the verticals
      for (column <- 0 to 2) {
        val currentColumn = Array(spaces(0)(column), spaces(1)(column), spaces(2)(column))
        if (currentColumn.deep == winner) {
          return player
        }
      }

      // Check the first diagonal
      var diag = Array(spaces(0)(0), spaces(1)(1), spaces(2)(2))
      if (diag.deep == winner) {
        return player
      }

      diag = Array(spaces(0)(2), spaces(1)(1), spaces(2)(0))
      if (diag.deep == winner) {
        return player
      }

    }

    ' '
  }

  override def toString(): String = {
    var board = ""
    for (row <- spaces) {
      board += "| "
      for (space <- row) {
        board += s"${space} "
      }

      board += "|\n"
    }
    board
  }


}
