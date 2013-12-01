package day2

trait Censor {

  val curseWords = Map(
    "Shoot" -> "Pucky",
    "Darn" -> "Beans"
  )

  def replace(text: String): String = {
    (text /: curseWords) {
      (currentText: String, replacement: (String, String)) =>
        currentText.replaceAll(replacement._1, replacement._2)
    }
  }

}
