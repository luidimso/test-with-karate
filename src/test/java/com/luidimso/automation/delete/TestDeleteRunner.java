package com.luidimso.automation.delete;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestDeleteRunner {

	@Test
	public Karate runTest() {
		return Karate.run("deleteJobDescription").relativeTo(getClass());
		
	}
	
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar