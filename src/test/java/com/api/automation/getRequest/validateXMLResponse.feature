Feature: To validate the GET end point 
	To validate the get end point response
	
	Background: Set up base url 
		Given url 'http://localhost:9898'
		
		Scenario: To get the data in xml format 
		Given path '/normal/webapi/all'
		And header Accept = 'application/xml'
		When method get
		Then status 200
		And print response
		And match response/List/item/jobId == '1'
		And match response/List/item/jobTitle == 'Software Engg'
		And match response/List/item/experience/experience[1] == 'Google'
		And match response/List/item/project/project[1] == 'Google'
		And match response/List/item/project/project/technology/technology[1] == 'Kotlin'
		#Skip the response keyword
		And match /List/item/project/project/technology/technology[1] == 'Kotlin'
		# Traverse the xml similar to JSON 
		And matcg response.List.item.experience.experience[0] == 'Google'