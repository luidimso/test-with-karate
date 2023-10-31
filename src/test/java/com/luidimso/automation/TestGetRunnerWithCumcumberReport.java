package com.luidimso.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.junit5.Karate.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class TestGetRunnerWithCumcumberReport {

	@Test
	public void runTest() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/luidimso/automation");
		Results result = aRunner.parallel(1);
		generateCumcumberReport(result.getReportDir());
		
	}
	
	private void generateCumcumberReport(String reportDirLoacation) {
		File reportDir = new File(reportDirLoacation);
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		List<String> jsonFiles = new ArrayList<String>();
		
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(reportDir, "Karate report");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
	}
	
}

// java -jar -Dserver.port-9897 jobportal-0.0.1-SNAPSHOT.jar