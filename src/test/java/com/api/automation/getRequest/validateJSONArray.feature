Feature: To validate the GET end point
  To validate the get end point response

  Background: Set up base url
    Given url 'http://localhost:9898'

  Scenario: To get the data in json format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response[0].jobId == 1
    And match response[0].experience[1] == 'Apple'
    And match response[0].project[0].projectName == 'Movie App'
    And match response[0].project[0].technology[2] == 'Gradle'
    #validate the size of array
    And match response[0].experience == '#[3]'
    And match response[0].project[0].technology =='#[3]'
    #use wild card character
    And match response[0].experience[*] == ['Google','Apple','Mobile Iron']
    And match response[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    # contains keyword
    And match response[0].experience[*] contains ['Apple','Mobile Iron']
    And match response[0].project[0].technology[*] contains ['SQL Lite']
    And match response[*].jobId contains 1

  Scenario: To get the data in json format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response[0].jobId == '#present'
    And match response[0].experience[1] == '#notnull'
    And match response[0].project[0].projectName == '#ignore'
    And match response[0].jobTitle == '#string'
    And match response[0].jobId == '#number'
		#complex Fuzzy Maytcher
		And match response[0].jobId == '#?_==1'
		And match response[0].jobTitle == '#string?_.length >=2'
		#to validate the array 
		And match response[0].experience =='#[]'
		And match response[0].experience =='#[3]'
		#Make sure it is an array of string
		And match response[0].experience =='#[3] #string'
		And match response[0].experience =='#[3] #string? _.length >=2'