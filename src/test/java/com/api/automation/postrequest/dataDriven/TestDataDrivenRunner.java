package com.api.automation.postrequest.dataDriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestDataDrivenRunner {
	@Test
	public Karate runTest() {
		return Karate.run("postDataDriven").relativeTo(getClass());
	}
}
