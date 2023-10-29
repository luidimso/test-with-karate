package com.luidi.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPutRunner {

	@Test
	public Karate runTest() {
		return Karate.run("updateJobEntry").relativeTo(getClass());
		
	}
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar