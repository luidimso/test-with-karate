Feature: To create a job entry in the application
		Helper of job fie
			
		Scenario: To apdate a job entry in JSON format
			Given url 'http://localhost:9191'
			And path '/normal/webapi/add'
			And request {"jobId": 619, "jobTitle": "Backend Developer", "jobDescription": "To develop web applications","experience": ["Developer"],"project": [{"projectName": "Social Media","technology": ["JavaScript"]}]}
			And headers {Accept : 'application/json', Content-type : 'application/json'}
			When method post
			And status 201'