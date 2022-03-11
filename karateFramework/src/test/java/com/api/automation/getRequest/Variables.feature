Feature: Variables creation in Karate Framework

  Background: Create and initialize variables
    * def app_name = "Google"
    * def pageLoadTimeOut = "20"

  # <Gherkin Keyword> <def> <Variable_name> = <value>
  # * <def> <Variable_name> = <value>
  Scenario: To create a variable
    # Use variable for repeating value.
    # Storing the data from a external file
    # In the matcher expression
    # Passing the data from one feature file to another
    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int variable==>", var_int
    And print "String variable==>", var_string
    * def var_int2 = var_int + 10
    And print "Int variable==>", var_int2
    And print "BackGround Section Variable ==>", app_name, pageLoadTimeOut

  Scenario: Access the Variable
    * def var_int = 1
    * def var_string = "New"
    * def var_int2 = var_int + 10
    Given print "Previous Scenario ==>", var_int
    And print "Previous Scenario ==>", var_string
    And print "Previous Scenario ==>", var_int2
    And print "BackGround Section Variable ==>", app_name, pageLoadTimeOut
