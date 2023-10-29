Feature: To upload a file using Karate Framework
		
		Background: Setup the Base path
			Given url 'http://localhost:9191'
			And print 'Backgrount seted up'
			
		Scenario: To upload file
			Given path '/normal/webapi/upload'
			* def file = 'file.txt'
			And multipart file file = { read: '#(file)', filename: '#(file)', Content-type: 'multipart/form-data' }
			When method post
			Then status 200
			And print response
			And match response.message contains 'file.txt'
