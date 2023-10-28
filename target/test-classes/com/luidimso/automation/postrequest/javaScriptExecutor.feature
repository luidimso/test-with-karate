Feature: To exeute JavaScript functions
		
		Scenario: To execute a JavaScript function
			* def getIntValue = function(value) {return value;}
			Then print getIntValue("Hello")