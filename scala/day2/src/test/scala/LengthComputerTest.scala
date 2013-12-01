package day2

import org.scalatest.{Matchers, FlatSpec}

class LengthComputerTest extends FlatSpec with Matchers {

  it should "return zero for an empty list" in {
    LengthComputer.sizeOf(List()) should be(0)
  }

  it should "return the size of a single word" in {
    LengthComputer.sizeOf(List("foo")) should be(3)
  }

  it should "return the correct size of multiple words" in {
    LengthComputer.sizeOf(List("foo", "Bar", "This has spaces")) should be(21)
  }

}
