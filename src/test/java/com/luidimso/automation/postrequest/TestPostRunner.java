package com.luidimso.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {

	@Test
	public Karate runTest() {
		return Karate.run("createJobEntry", "createJobEntry", "javaScriptExecutor").relativeTo(getClass());
		
	}
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar