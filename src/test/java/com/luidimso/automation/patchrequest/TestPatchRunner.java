package com.luidimso.automation.patchrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPatchRunner {

	@Test
	public Karate runTest() {
		return Karate.run("updateJobDescription").relativeTo(getClass());
		
	}
	
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar