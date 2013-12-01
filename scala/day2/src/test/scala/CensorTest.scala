package day2

import org.scalatest.{Matchers, FlatSpec}

class CensorTest extends FlatSpec with Matchers with Censor {

  it should "return the same string with no censored words" in {
    replace("Nothing bad here") should be("Nothing bad here")
  }

  it should "replace the word 'Shoot' with 'Pucky'" in {
    replace("Please don't Shoot me") should be("Please don't Pucky me")
  }

  it should "replace the word 'Darn' with 'Beans'" in {
    replace("Hey pass the Darn") should be("Hey pass the Beans")
  }

  it should "replace both curse words" in {
    replace("Oh Darn - I just want to Shoot something") should be("Oh Beans - I just want to Pucky something")
  }

}