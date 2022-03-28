Feature: To use the json path epxression.

  Background: Create and initialize base Url
    Given url 'http://localhost:9898'
    And print '========This is background keyword==============='

  Scenario: To get the value of propperty using json path expression
    Given path 'normal/webapi/all'
    When method get
    Then status 200
    # karate.jsonPath(doc,jsonPathExpression)
    * def jobId = 1;
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId=="+ jobId +")].jobTitle")
    * def jobDescription = karate.jsonPath(response, "$[?(@.jobId=="+ jobId +")].jobDescription")
    * def experience = karate.jsonPath(response, "$[?(@.jobId=="+ jobId +")].experience")
    And print "job Title==>", jobTitle
    And print "job Description==>", jobDescription
    And print "job Experience==>", experience
