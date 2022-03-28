@ignore
Feature: To validate the GET end point 
	To validate the get end point response
	
	Background: Set up base url 
		Given url 'http://localhost:9898'
		
		
		
		Scenario: To get the data in json format and validate the match keyword
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		And match response ==
		"""
		[
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ],
    "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
    ]
  }
]
		"""
		
				Scenario: To get the data in json format and validate using negate condition
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		And match response !=
		"""
		[
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ],
    "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
    ]
  }
]
		"""
		
			Scenario: To get the data in json format and validate a specific property
		Given path '/normal/webapi/all'
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		And match response contains deep {"jobDescription": "To develop andriod application"}
		And match response contains deep {"project":[{"projectName": "Movie App"}]}
		And match header Content-Type == 'application/json'
		And match header Connection == 'keep-alive'
		
		
		