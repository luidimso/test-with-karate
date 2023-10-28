Feature: To create a job entry in the application
		To use POST as method to create a job entry in the application
		
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
			And print response
			And match response.jobId == 619