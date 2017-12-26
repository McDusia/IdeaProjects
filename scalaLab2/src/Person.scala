/**
  * Created by Madzia on 27.03.2017.
  */
import scala.beans.BeanProperty
class Person (name: String, @BeanProperty var surnameA: String, idA: String){
  private val id = idA
  private val givenName = name
  private var surname: String = surnameA

  def getName(): String = givenName + " " + surname
  def setSurname(surnameA: String) = surname = surnameA
  protected def getId: String = id

}
