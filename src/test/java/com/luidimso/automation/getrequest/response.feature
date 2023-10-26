Feature: To validate the GET endpoint
		To validate the endpoint response
		
		Background: Setup the Base URL
			Given url 'http://localhost:9191'
			
		Scenario: To get the data in JSON 
			And path '/normal/webapi/all'
			And header Accept = 'application/json'
			When method get
			Then status 200
			And print response