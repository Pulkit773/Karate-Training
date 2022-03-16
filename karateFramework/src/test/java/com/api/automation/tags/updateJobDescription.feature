Feature: To test the patch end point for updating the job description
  Patch /normal/webapi/update/details

  Background: Create and Initialize base URL
    Given url 'http://localhost:9898'

  @Smoke @Regression
  Scenario: To update the job description for newly added job entry
    # Create a new job entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch Request
    * def jobDes = 'Update: To develop andriod application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(createJobId)', jobTitle: 'Software Engg',jobDescription:'#(jobDes)' }
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    And match response.jobDescription == jobDes

  Scenario: To update the job description for newly added job entry with non-existing job id
    # Create a new job entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch Request
    * def jobDes = 'Update: To develop andriod application'
    Given path '/normal/webapi/update/details'
    And params {id:'-1', jobTitle: 'Software Engg',jobDescription:'#(jobDes)' }
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 404

  Scenario: To update the job description for newly added job entry without job title
    # Create a new job entry
    # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function(){return Math.floor((100)* Math.random())}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature"){_url: 'http://localhost:9898',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    # Patch Request
    * def jobDes = 'Update: To develop andriod application'
    Given path '/normal/webapi/update/details'
    And params {id:'-1',jobDescription:'#(jobDes)' }
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
