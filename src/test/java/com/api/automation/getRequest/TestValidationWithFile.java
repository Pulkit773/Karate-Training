package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestValidationWithFile {

	@Test
	public Karate runTest() {
		return Karate.run("ValidationUsingFile.feature").relativeTo(getClass());
	}

}
