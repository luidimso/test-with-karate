1-Feature: To test the get endpoint of application
		To test different get endpoint with different data format supported by the application
		
		Scenario: To get all the data from application in JSON format
			Given url 'http://localhost:9191/normal/webapi/all'
			When method get
			Then status 200
