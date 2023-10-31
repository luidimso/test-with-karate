package com.luidimso.automation.secure;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {

	@Test
	public Karate runTest() {
		return Karate.run("secureGetRequest").relativeTo(getClass());
		
	}
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar