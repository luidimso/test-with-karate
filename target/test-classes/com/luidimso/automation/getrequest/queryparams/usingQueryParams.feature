Feature: To test a GET request with paramters
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			* def getJobId = function(value) {return Math.floor((100) * Math.random());}
			* def createId = getJobId()
			
		Scenario: To find a job entry created
			* def postRequest = call read("../../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			Given path '/normal/webapi/find'
			And param id = createId
			And param jobTitle = 'Backend Developer'
			And headers {Accept : 'application/json'}
			When method get
			Then status 200
			And match response.jobId == createId
			
			
		Scenario: To find a wrong job entry not created
			* def postRequest = call read("../../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			Given path '/normal/webapi/find'
			And param id = 2
			And param jobTitle = 'Backend Developer'
			And headers {Accept : 'application/json'}
			When method get
			Then status 404