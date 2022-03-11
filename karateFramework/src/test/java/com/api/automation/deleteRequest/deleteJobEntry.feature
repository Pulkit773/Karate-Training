Feature: To test the delete end point
  DELETE /normal/webapi/remove/{id}

  Background: Create and initialize base Url
    Given url 'http://localhost:9898'

  Scenario: To delete the job entry from application using job id
    #Create a new job entry
    #Delete the newly  created job entry
    #Get request with query parameter and check for 404 error
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Delete Request
    Given path 'normal/webapi/remove/'+createJobId
    And header Accept = 'application/json'
    When method delete
    Then status 200
    And print response
    #Get request
    Given path '/normal/webapi/find'
    And params {id : '#(createJobId)', jobTitle : 'Software Engg'}
    And headers {Accept:'application/json'}
    When method get
    Then status 404
    
      Scenario: To delete the job entry from application using job id and delete the job entry twice
    #Create a new job entry
    #Delete the newly  created job entry
    #Get request with query parameter and check for 404 error
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Delete Request
    Given path 'normal/webapi/remove/'+createJobId
    And header Accept = 'application/json'
    When method delete
    Then status 200
    #Delete Again
    Given path 'normal/webapi/remove/'+createJobId
    And header Accept = 'application/json'
    When method delete
    Then status 404
    
    Scenario: To demo request chaining
    
   
    
