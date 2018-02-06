#!/bin/sh
exec scala -savecompiled "$0" "$@"
!#

import scala.xml.XML

object Numbers extends App {

  val teams = XML.loadFile(args(0))
  val teamAnswerPrompt: String = "Введите ответ команды "

  def getTeamName (teamnumber: String): Int = {
    val teamName = (teams \ teamnumber \ "@name").head
    teamName.toString
  }
  
}
