package com.api.automation.getRequest.ignore;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {

	
	  @Test 
	  public Karate runTest() { return
	  Karate.run("getRequest","responseMatcher","validateJSONArray","validateXMLResponse.feature").relativeTo(getClass()); }
	 
	/*//@Test
		public Karate runTest() {
			return Karate.run("validateJSONArray").relativeTo(getClass());
		}

	//@Test
	public Karate runTestUsingClassPath() {
		return Karate.run("classpath:com/api/automation/getRequest/getRequest.feature");*/
		
	}
