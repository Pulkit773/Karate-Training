Feature: To test the GET end point with the query parameter
  GET /normal/webapi/find

  Background: Create and Initialize base URL
    Given url 'http://localhost:9898'

  Scenario: To get the data using Query Parameter
    #Create the job entry
    # Get the newly created Job entry using Query Param
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the GET request with query Param
    Given path 'normal/webapi/find'
    #	And param id = createJobId
    #	And param jobTitle = "Software Engg"
    And params {id : '#(createJobId)', jobTitle : 'Software Engg'}
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId

  Scenario: To get the data using Query Parameter with job id not in the application
    #Create the job entry
    # Get the newly created Job entry using Query Param
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the GET request with query Param
    Given path 'normal/webapi/find'
    And param id = 03121991
    And param jobTitle = "Software Engg"
    And headers {Accept:'application/json'}
    When method get
    Then status 404
    
