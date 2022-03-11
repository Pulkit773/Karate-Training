Feature: To create job description in the test application

  Background: Read the data for data driven
    * def testdata = read("testdata.csv")

  Scenario Outline: To create job description in the test application <method>
    Given print '<url>'
    And print '<path>'
    When print '<method>'
    Then print '<status>'

    Examples: 
      | url                   | path              | method | status |
      | http://localhost:9898 | normal/webapi/all | get    |    200 |
      | http://localhost:9898 | normal/webapi/add | post   |    201 |
      | http://localhost:9898 | normal/webapi/add | put    |    201 |

  Scenario Outline: Data Driven for the job Description entry - <jobId>
    Given url 'http://localhost:9898'
    And path 'normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status <status>

    Examples: 
      | jobId | jobTitle      | jobDescription                 | status |
      |     2 | Software Engg | To develop andriod application |    201 |
      | id    | Software Engg | To develop andriod application |    400 |
      | false | Software Engg | To develop andriod application |    400 |

  Scenario Outline: Data Driven for the job Description entry using csv files
    Given url 'http://localhost:9898'
    And path 'normal/webapi/add'
    And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status <status>

    Examples: 
      #|testdata|
      |read("testdata.csv")|