Feature: To delete a job entry
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			* def getJobId = function(value) {return Math.floor((100) * Math.random());}
			* def createId = getJobId()
			
		Scenario: To delete a new job entry
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			Given path '/normal/webapi/remove/' + createId
			And headers {Accept : 'application/json'}
			When method delete
			Then status 200
			Given path '/normal/webapi/find'
			And param id = createId
			And param jobTitle = 'Backend Developer'
			And headers {Accept : 'application/json'}
			When method get
			Then status 404
			
			
		Scenario: To delete a new job entry
			* def postRequest = call read("../createJobEntry.feature") {_url: 'http://localhost:9191', _path: '/normal/webapi/add', _id: '#(createId)'}
			Given path '/normal/webapi/remove/' + createId
			And headers {Accept : 'application/json'}
			When method delete
			Then status 200
			Given path '/normal/webapi/remove/' + createId
			And headers {Accept : 'application/json'}
			When method delete
			Then status 404