
Feature: To create the job entry in the application
  Use POST /normal/webapi/add to create job entry in the application

  Background: Create and Initialize base Url
    Given url 'http://localhost:9898'

  Scenario: To create the Job Entry in JSON format
    Given path '/normal/webapi/add'
    And request {"jobId":125,"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg"

  Scenario: To create the Job Entry in JSON format
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg"

  Scenario: To create the Job Entry in JSON format with Embedded Expression
    Given path '/normal/webapi/add'
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    And request {"jobId":'#(getJobId())',"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg"
