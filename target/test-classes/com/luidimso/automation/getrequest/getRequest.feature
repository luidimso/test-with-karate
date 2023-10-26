Feature: To test the point of application
		To test different get endpoint with different data format supported by the application
		
		Scenario: To test the get endpoint with JSON data
			Given the application url 'www.google.com'
			And the context path is '/getData'
			When I send the get request
			Then status code should be 200
			And the format should be in JSON