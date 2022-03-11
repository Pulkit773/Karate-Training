package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;


public class ParallelRunner {

	@Test
	public void executeKarateTest() {
		Runner.parallel(getClass(), 5);
	}
}
