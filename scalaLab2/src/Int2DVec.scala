/**
  * Created by Madzia on 27.03.2017.
  */

class Int2DVec private (val x: Int, val y: Int) {

  //Auxiliary constructors
  /*def this() = {
    this(0,0)
    println("Creating Int2DVac(0,0)")

  }
  def this(prototype: Int2DVec) = {
    this(prototype.x, prototype.y)
    println("Copy-constructor working")
  }*/
  def +(other: Int2DVec) = new Int2DVec(x + other.x, y + other.y)
  def unary_- = new Int2DVec(-x, -y)
  def *(other: Int2DVec) = new Int2DVec(x*other.x, y*other.y)
  def -(other: Int2DVec) = new Int2DVec(x - other.x,y - other.y)
  override def toString() = "(" + x.toString + "," + y.toString + ")"

  //obiekt towarzyszacy
  object Int2DVec {
    def apply(x: Int, y: Int) = new Int2DVec(x, y)
    def apply() = new Int2DVec(0, 0)
    def apply(prototype: Int2DVec) = new Int2DVec(prototype.x, prototype.y)
    //def unitVectorOf(v: Int2DVec ) =

  }

}


//deklaracja pakietów z kropką

//kartkówka - pytanie z obiektowości, trait -