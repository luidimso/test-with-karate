package com.luidimso.automation.config.report;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.gherkin.model.And;
import com.aventstack.extentreports.gherkin.model.Feature;
import com.aventstack.extentreports.gherkin.model.Given;
import com.aventstack.extentreports.gherkin.model.Scenario;
import com.aventstack.extentreports.gherkin.model.Then;
import com.aventstack.extentreports.gherkin.model.When;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;
import com.intuit.karate.Results;
import com.intuit.karate.core.Result;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.core.Step;

public class CustomExtentReport {
	private ExtentReports extentReports;
	private ExtentSparkReporter extentSparkReport;
	private String reportDir;
	private String reportTitle = "Karate Test Execution Report";
	private Results testResults;
	private ExtentTest featureNode;
	private String featureTitle = "";
	private ExtentTest scenarioeNode;
	private String scenarioTitle = "";
	
	public CustomExtentReport() {
		extentReports = new ExtentReports();
	}
	
	public CustomExtentReport withReportDir(String reportDir) {
		this.reportDir = reportDir;
		
		return this;
	}
	
	public CustomExtentReport withKarateResult(Results testResults) {
		this.testResults = testResults;
		
		return this;
	}
	
	public CustomExtentReport withReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
		
		return this;
	}
	
	public void generateExtentReport() {
		if(this.reportDir != null && !this.reportDir.isEmpty() && this.testResults != null) {
			extentSparkReport = new ExtentSparkReporter(reportDir);
			extentReports.attachReporter(extentSparkReport);
			
			setConfig();
			
			List<ScenarioResult> scenarioResults = getScenarioResults();
			
			scenarioResults.forEach((scenarioResult) -> {
				String featureName = getFeatureName(scenarioResult);
				String featureDescription = getFeatureDescription(scenarioResult);
				ExtentTest featureNode = createFeatureNode(featureName, featureDescription);
				String scenarioTitle = getScenarioTitle(scenarioResult);
				ExtentTest scenarioNode = createScenarioNode(featureNode, scenarioTitle);
				
				scenarioResult.getStepResults().forEach((step) -> {
					addScenarioStep(scenarioNode, step.getStep(), step.getResult());
				});
			});
			
			extentReports.flush();
			return;
		}
		
		throw new RuntimeException("Karate test result or Report location is missing");
	}
	
	@SuppressWarnings("unchecked")
	private List<ScenarioResult> getScenarioResults() {
		return (List<ScenarioResult>) this.testResults.getScenarioResults();
	}
	
	private String getFeatureName(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getFeature().getName();
	}
	
	private String getFeatureDescription(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getFeature().getDescription();
	}
	
	private ExtentTest createFeatureNode(String name, String description) {
		if(this.featureTitle.equalsIgnoreCase(name)) {
			return featureNode;
		}
		
		this.featureTitle = name;
		featureNode = extentReports.createTest(Feature.class, name, description);
		
		return featureNode;
	}
	
	private ExtentTest createScenarioNode(ExtentTest featureNode, String title) {
		if(this.scenarioTitle.equalsIgnoreCase(title)) {
			return scenarioeNode;
		}
		
		this.scenarioTitle = title;
		scenarioeNode = featureNode.createNode(Scenario.class, title);
		
		return scenarioeNode;
	}
	
	private String getScenarioTitle(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getName();
	}
	
	private void addScenarioStep(ExtentTest scenarioNode, Step step, Result result) {
		String type = step.getPrefix();
		String stepTitle = step.getText();
		String status = result.getStatus();
		Throwable error = result.getError();
		ExtentTest stepNode;
		
		switch (type) {
		case "Given":
			stepNode = scenarioNode.createNode(Given.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "When":
			stepNode = scenarioNode.createNode(When.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "Then":
			stepNode = scenarioNode.createNode(Then.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "And":
			stepNode = scenarioNode.createNode(And.class, stepTitle);
			addStatus(stepNode, status, error);
			break;

		default:
			stepNode = scenarioNode.createNode(type + " " + stepTitle);
			break;
		}
	}
	
	
	private void addStatus(ExtentTest stepNode, String status, Throwable error) {
		switch (status) {
		case "passed":
			stepNode.pass("");
			break;
		case "failed":
			stepNode.fail(error);
			break;

		default:
			stepNode.skip("");
			break;
		}
	}
	
	
	private void setConfig() {
		extentSparkReport.config().enableOfflineMode(true);
		extentSparkReport.config().setDocumentTitle(featureTitle);
		extentSparkReport.config().setTimelineEnabled(true);
		extentSparkReport.config().setTheme(Theme.DARK);
	}
}
