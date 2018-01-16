#!/bin/sh
exec scala -savecompiled "$0" "$@"
!#

import scala.xml.XML

object Checkout extends App {

  val pricingFromFile = XML.loadFile(args(0))
  val userPrompt: String = "Enter Q to quit or enter the item's SKU: "

  def getItemPrice (sku: String): Int = {
    val price = (pricingFromFile \ sku \ "@price").head
    price.toString.toInt
  }

  def validUserInput (userinput: String): Boolean = {
    val testedItem = pricingFromFile \\ userinput
    if (testedItem.isEmpty) {
      false
    } else {
    val sku = testedItem.head.label
    sku.contains(userinput)
    }
  }

  def calculateCartTotal (cartcontents: Vector[String]): Int = {
    val itemPrices: Vector[Int] = cartcontents.map( x => getItemPrice(x))
    itemPrices.reduce(_ + _)
  }

  def addToShoppingCart() = {
    var shoppingCart = Vector[String]()
    var userInput = readLine(userPrompt).capitalize
    while (validUserInput(userInput) && userInput != "Q") {
      shoppingCart = shoppingCart :+ userInput
      var total = calculateCartTotal(shoppingCart)
      println(s"Items scanned: ${shoppingCart.mkString}. Total: $total")
      userInput = readLine(userPrompt).capitalize
    }
    System.exit(1)
  }

  addToShoppingCart()

}