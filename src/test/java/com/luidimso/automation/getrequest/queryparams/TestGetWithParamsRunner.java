package com.luidimso.automation.getrequest.queryparams;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetWithParamsRunner {

	@Test
	public Karate runTest() {
		return Karate.run("usingQueryParams").relativeTo(getClass());
		
	}
	
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar