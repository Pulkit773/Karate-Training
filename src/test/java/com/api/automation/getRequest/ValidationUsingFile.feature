Feature: To validate the GET end point
  To validate the get end point response

  Background: Set up base url
    Given url 'http://localhost:9898'

  Scenario: To get the data in json format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # Create a variable to store the data from external file 
    * def actualResponse = read("../JsonResponse.json")
    And print "File ==>", actualResponse
    And match response == actualResponse