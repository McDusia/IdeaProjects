/**
  * Created by Madzia on 27.03.2017.
  */
object Appl {
def main(args: Array[String]) {
  val janek = new Person("Jan", "Kowalski", "1234567890")
  println(janek.getName)
  println(janek.getSurnameA)
  janek.setSurnameA("Nowak")
  println(janek.getSurnameA())
  val v1 = new Int2DVec(1, 2)
  val v2 = new Int2DVec(10, 20)
  val v3 = v1 + v2
  val v4 = -v2
  println(v3)
  //println(v4)
  println(v4.toString())
  val v5 = v1 * v2
  val v6 = v1 - v2
  println(v5.toString())
  println(v6.toString())


  println(new Int2DVec(2,3))
  println(v1)
  }
}
