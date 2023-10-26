Feature: To validate the GET endpoint
		To validate the endpoint response
		
		Background: Setup the Base URL
			Given url 'http://localhost:9191'
			
	  Scenario: To get the data in JSON and validate properties
			And path '/normal/webapi/all'
			And header Accept = 'application/json'
			When method get
			Then status 200
			And match response.[0].jobId == 1
			And match response.[0].experience[1] == 'Apple'
			#valite the sixe of array
			And match response.[0].experience == '#[3]'
			#validate the whole array
			And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"]
			And match response.[0].experience[*] contains ["Google","Apple"]
			