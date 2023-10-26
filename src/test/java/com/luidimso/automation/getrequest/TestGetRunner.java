package com.luidimso.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {

	@Test
	public Karate runTest() {
		return Karate.run("getRequest2").relativeTo(getClass());
		
	}
	
	@Test
	public Karate runTestUsingClassPath() {
		return Karate.run("classpath:com/luidimso/automation/getrequest/getrequest2.feature");
	}
	
}
