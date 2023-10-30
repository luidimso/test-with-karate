Feature: To update a job entry in the application
		To use PUT as method to updatee a job entry in the application
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			* def getJobId = function(value) {return Math.floor((100) * Math.random());}
			* def id = getJobId()
			* def body = {"jobId": "#(id)", "jobTitle": "Web Developer", "jobDescription": "To develop web applications","experience": ["Developer"],"project": [{"projectName": "Social Media","technology": ["JavaScript"]}]}

		Scenario: To apdate a job entry in JSON format
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(id)'}
			Given path '/normal/webapi/update'
			And request {"jobId": '#(id)', "jobTitle": "Backend Developer", "jobDescription": "To develop web applications","experience": ["Developer"],"project": [{"projectName": "Social Media","technology": ["JavaScript"]}]}
			And headers {Accept : 'application/json', Content-type : 'application/json'}
			When method put
			And status 200
			And response.jobTitle == 'Backend Developer'