package day2

object LengthComputer {

  def sizeOf(words: List[String]): Int = {
    (0 /: words) {(size, word) => size + word.size}
  }

}
