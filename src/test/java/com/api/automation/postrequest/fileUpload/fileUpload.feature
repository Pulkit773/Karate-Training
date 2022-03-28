Feature: To upload the file using the Karate Framework.

  Background: Create and initialize base Url
    Given url 'http://localhost:9898'
    
    Scenario: To upload the file in the test application.
    Given path '/normal/webapi/upload'
    # location of file, name of file , content-type header value  
    And multipart file file = { read:'FileToUpload.txt', filename:'FileToUpload.txt', Content-type:'multipart/form-data'}
    When method post 
    Then status 200
    And print response
    
      Scenario: To upload the file in the test application with JSON data.
    Given path '/normal/webapi/upload'
    # location of file, name of file , content-type header value
    * def fileLocation = '../data/jobEntry.json'  
    And multipart file file = { read:'#(fileLocation)', filename:'jobEntry.json', Content-type:'multipart/form-data'}
    When method post 
    Then status 200
    And print response
    And mathc response.message contains 'jobEntry.json'