Feature: To test the get endpoint of application
		To test different get endpoint with different data format supported by the application
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
		
		Scenario: To get all the data from application in JSON format
			#Given url 'http://localhost:9191/normal/webapi/all'
			Given path '/normal/webapi/all'
			When method get
			Then status 200
			
		Scenario: To get all the data from application in JSON format using path variable
			#Given url 'http://localhost:9191'
			And path '/normal/webapi/all'
			When method get
			Then status 200
			
		Scenario: To get all the data from application in JSON format using path variable with XML response
			And path '/normal/webapi/all'
			And header Accept = 'application/xml'
			When method get
			Then status 200
