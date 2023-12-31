Feature: To validate JSON properties
		To validate the properties od JSON response
		
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
			
			
	 Scenario: To get the data in JSON and validate properties using fuzzy methods
			And path '/normal/webapi/all'
			And header Accept = 'application/json'
			When method get
			Then status 200
			And match response.[0].jobId == '#present'
			And match response.[0].experience[1] == '#notnull'
			And match response.[0].experience == '#array'
			And match response.[0].experience[1] == '#string'
			#complex fuzzy matcher (self reference)
			And match response.[0].jobId == '#? _ >= 1'
			#complex fuzzy matcher (get string type properties)
			And match response.[0].jobTitle == '#string? _.length >= 1'