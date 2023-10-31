Feature: To update the job description of a job entry
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			* def getJobId = function(value) {return Math.floor((100) * Math.random());}
			* def createId = getJobId()
			
		Scenario: To update the job description
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			* def description = 'A description'
			Given path '/normal/webapi/update/details'
			And param id = createId
			And param jobTitle = 'Backend Developer'
			And param jobDescription = description
			And headers {Accept : 'application/json'}
			When method patch
			Then status 200
			And match response.jobDescription == description
			
			
		Scenario: To dont update a wrong job entry
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			* def description = 'A description'
			Given path '/normal/webapi/update/details'
			And param id = 100
			And param jobTitle = 'Backend Developer'
			And headers {Accept : 'application/json'}
			And param jobDescription = description
			When method patch
			Then status 404
			
			
		Scenario: To dont let update with a bad request
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			* def description = 'A description'
			Given path '/normal/webapi/update/details'
			And param jobTitle = 'Backend Developer'
			And headers {Accept : 'application/json'}
			And param jobDescription = description
			When method patch
			Then status 400