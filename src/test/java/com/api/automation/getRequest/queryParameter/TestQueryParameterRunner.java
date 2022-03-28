package com.api.automation.getRequest.queryParameter;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParameterRunner {
	@Test
	public Karate runTest() {
		return Karate.run("queryParameter.feature").relativeTo(getClass());
	}

}
