Feature: To get the variables set by Karate-config.js file

  Background: To get the value of myVarName
    * def localmyVarName = myVarName
    Given print "BackGround Variable value ==>", localmyVarName

  Scenario: To get the value of username and password from karate-config.js
    * def localusername = usernmae
    Given print "scenario Variable value ==>", localusername
    And print "scenario Variable value ==>", password
