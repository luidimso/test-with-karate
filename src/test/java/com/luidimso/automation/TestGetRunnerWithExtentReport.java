package com.luidimso.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.junit5.Karate.Test;
import com.luidimso.automation.config.report.CustomExtentReport;

public class TestGetRunnerWithExtentReport {
	@Test
	public void runTest() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/luidimso/automation");
		Results result = aRunner.parallel(1);
		CustomExtentReport extentReport = new CustomExtentReport().withKarateResult(result).withReportDir(result.getReportDir()).withReportTitle("Karate Test Execution Report");
		extentReport.generateExtentReport();
	}
}
