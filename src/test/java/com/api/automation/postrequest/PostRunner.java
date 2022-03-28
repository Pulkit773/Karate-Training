package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PostRunner {

	
	  @Test public Karate runTest1() { return
	  Karate.run("createJobEntry.feature").relativeTo(getClass()); }
	 

	
	  @Test public Karate runTest() { return
	  Karate.run("schemaValidation.feature").relativeTo(getClass()); }
	 

}
