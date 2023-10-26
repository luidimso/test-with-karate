Feature: To create variables as examples
		To create variables and test them
		
		Background: Create universal variables
			* def hello = 'Hello'

		
		Scenario: To create variables
			Given def variable = 10
			Then print variable
			* def variable_2 = variable + 619
			And print variable_2
			And print hello