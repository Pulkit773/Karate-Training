Feature: To test the get end point of the application
	To test different get end point with different data format supported by the application
	
	Background: Setup the Base path
	Given url _url
	And print  '========This is Background Keyword =========='
	

Scenario: To get all the data from the application in JSON format
#Given url 'http://localhost:9897/normal/webapi/all'
#Base path + Context Path 
Given path '/normal/webapi/all'
When method get # Send the get Request
Then status 200 # the status code response should be 200


Scenario: To get all the data from the application in JSON format using path variables
Given url 'http://localhost:9898'
And path '/normal/webapi/all'
And header Accept = 'application/json'
#Base path + Context path
When method get # Send the get Request
Then status 200 # the status code response should be 200

Scenario: To get all the data from the application in xml format using path variables
Given url 'http://localhost:9898'
And path '/normal/webapi/all'
And header Accept = 'application/xml'
#Base path + Context path
When method get # Send the get Request
Then status 200 # the status code response should be 200