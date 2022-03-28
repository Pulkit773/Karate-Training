Feature: Validate the JSON schema
  #To validate the JSON Schema for POST /normal/webapi/add

  Background: Create and initialize base Url
    Given url 'http://localhost:9898'

  Scenario: To create the Job Entry in JSON format
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response ==
      """
      {
          "jobId": '#number',
          "jobTitle": '#string',
          "jobDescription": '#string',
          "experience": '#[] #string',
          "project": '#[] #object'
      }
      """

  Scenario: Schema Validation for GET end point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def projectSchema = {"projectName": '#string',"technology": '#[] #string'}
    * def mainSchema = {"jobId":'#number', "jobTitle":'#string',"jobDescription":'#string',"experience": '#[] #string',"project": '#[] ##(projectSchema)'}
    And match response ==
      """
      '#[] ##(mainSchema)'
      """
