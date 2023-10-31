Feature: To access GEt endpoint with secure Basic Auth
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
		
		#admin.welcome
		Scenario: To get all the data from application with Basic Auth
			Given path '/secure/webapi/all'
			And headers {Accept : 'application/json', Authorization : 'Basic YWRtaW46d2VsY29tZQ=='}
			When method get
			Then status 200
			And match response == '#notnull'
			
		Scenario: To not let access endpoint (no credencials)
			Given path '/secure/webapi/all'
			And headers {Accept : 'application/json'}
			When method get
			Then status 401
			
		Scenario: To not let access endpoint (wrong credencials)
			Given path '/secure/webapi/all'
			And headers {Accept : 'application/json', Authorization : 'Basic YWRtaW46d2VsY29tZQ='}
			When method get
			Then status 401
