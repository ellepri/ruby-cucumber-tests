Feature: POST request
  As a tester
  I want to make sure POST method response is valid
  So that clients can use the API

  Scenario: Verify client response status
    Given I set the request headers
      | Content-Type | application/json |
    And I set the query parameters
      | a | a |
    When I make a POST request to /example with the following
    """
     { "title": "Title" }
    """
    Then response status code is 200
