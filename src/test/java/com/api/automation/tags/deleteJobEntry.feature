Feature: To test the delete end point
  DELETE /normal/webapi/remove/{id}

  Background: Create and initialize base Url
    Given url 'http://localhost:9898'

  @Smoke
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

  @Regression
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
    # Create a new job entry
    # Extract the job id and job title from the response of POST request.
    # Send the patch request, value of query parameter will set by, info extracted from previous request
    # Extract the job id and job title from the response of PATCH request.
    # Get request with query parameter, value of query param is set by info extracted from response of patch request
    # Add the validation on job description in the response of get request
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle
    #Path Request
    * def jobDes = 'Update: To develop andriod application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)', jobTitle: '#(jobTitle)',jobDescription:'#(jobDes)' }
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    #Get request with query parameters
    Given path 'normal/webapi/find'
    And params {id : '#(jobId)',jobTitle: '#(jobTitle)'}
    When method get
    Then status 200
    And match response.jobDescription == jobDes
