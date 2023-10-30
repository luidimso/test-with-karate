Feature: To create a job entry in the application
		Helper of job fie
			
		Scenario: To apdate a job entry in JSON format
			Given url _url
			And path _path
			And request {"jobId": '#(_id)', "jobTitle": "Backend Developer", "jobDescription": "To develop web applications","experience": ["Developer"],"project": [{"projectName": "Social Media","technology": ["JavaScript"]}]}
			And headers {Accept : 'application/json', Content-type : 'application/json'}
			When method post
			And status 201'