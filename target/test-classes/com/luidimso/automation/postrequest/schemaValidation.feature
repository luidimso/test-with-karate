Feature: To validate JSON schema
		To validate JSON schema for POSR request
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			* def body = {"jobId": 619, "jobTitle": "Web Developer", "jobDescription": "To develop web applications","experience": ["Developer"],"project": [{"projectName": "Social Media","technology": ["JavaScript"]}]}

		Scenario: To create a job entry in JSON format
			Given path '/normal/webapi/add'
			And request body
			And headers {Accept : 'application/json', Content-type : 'application/json'}
			When method post
			And status 201
			And match response == 
			***
			{
			"jobId": "#number",
			"jobTitle": "#string",
			"jobDescription": "@string",
			"experience": "#[] #string",
			"project": "#[] #object"
			}
			***