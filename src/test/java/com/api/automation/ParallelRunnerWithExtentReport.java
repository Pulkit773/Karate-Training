package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.api.automation.config.report.CustomExtentReport;
import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithExtentReport {
	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		Results result = aRunner.parallel(5);

		CustomExtentReport extentReport = new CustomExtentReport().withKarateResult(result)
				.withReportDir(result.getReportDir()).withReportTitle("Karate Test Execution Report");
		extentReport.generateExtentReport();
	}
}
