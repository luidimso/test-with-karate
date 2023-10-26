package com.luidimso.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {

	@Test
	public Karate runTest() {
		return Karate.run("getRequest2", "response", "validateJSONArray", "variables").relativeTo(getClass());
		
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:com/luidimso/automation/getrequest/getrequest2.feature");
//	}
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar