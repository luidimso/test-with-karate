package com.luidimso.automation.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestFileUploadRunner {

	@Test
	public Karate runTest() {
		return Karate.run("fileUpload").relativeTo(getClass());
		
	}
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar