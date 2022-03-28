Feature: To test the updation of job entry in the test application
  Test the end point PUT /normal/webapi/update

  Background: Create and Initialize base Url
    Given url 'http://localhost:9898'

  Scenario: To update the Job Entry for existing job in JSON format
    # Create a new job entry
    # Update the Job Entry using PUT Request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    Then status 201
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(id)',
        "jobTitle": "Software Engg-2",
        "jobDescription": "To develop andriod application and web application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle"
                ]
            },
            {
                "projectName": "Web App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Node"
                ]
            }
            
        ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id +")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for existing job in JSON format by calling another feature file
    #<Gherkin Keyword> <call> <read(<location of file>)>
    Given call read("../createJobEntry.feature")
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": 125,
        "jobTitle": "Software Engg-2",
        "jobDescription": "To develop andriod application and web application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle"
                ]
            },
            {
                "projectName": "Web App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Node"
                ]
            }
            
        ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And print projectArray
    And print "Response==>", response
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for existing job in JSON format by calling another feature file using shared context
    #<Gherkin Keyword> <call> <read(<location of file>)>
    #Given call read("../createJobEntry.feature")
    * def postRequest = call read("../createJobEntry.feature")
    And print "Calling Feature ==>", postRequest.id
    # And print "Calling Feature ==>", postRequest.getRandomValue()
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(postRequest.id)',
        "jobTitle": "Software Engg-2",
        "jobDescription": "To develop andriod application and web application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle"
                ]
            },
            {
                "projectName": "Web App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Node"
                ]
            }
            
        ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for existing job in JSON format by calling another feature file with variables
    # <Gherkin Keyword> <call> <read(<location of file>)>
    #Given call read("../createJobEntry.feature"){var1:value, var2:value}
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){_url:'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(id)'}
    #Put request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(id)',
        "jobTitle": "Software Engg-2",
        "jobDescription": "To develop andriod application and web application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle"
                ]
            },
            {
                "projectName": "Web App 1",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Node"
                ]
            }
            
        ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'
