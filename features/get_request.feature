Feature: GET Request
  As a tester
  I want to make sure GET method response is valid
  So that clients can use the API

  Scenario: Verify client response status
    Given I set the query parameters
      | a | a |
    When I make a GET request to /example
    Then response status code is 200

  Scenario Outline: Verify <header_name> header
    Given I set the request headers
      | <header_name> | <header_value> |
    And I set the query parameters
      | a | a |
    When I make a GET request to /example
    Then response status code is 200
    And response headers contain following
      | X-header | <response_header_value> |
    And all the uris in the response body contain following query parameter
      | header=<response_header_value> |

    Examples:
      | header_name | header_value | response_header_value |
      |             |              | header                |
      | X-header    |              | header                |
      | X-header    | header       | header                |
      | X-header    | header:x     | header:x              |
      | X-header    | unknown      | header:x              |

  Scenario: Verify JSON response contains text
    When I make a GET request to /example
    Then response status code is 200
    And response should contain following for module
      | id        | id        |
      | type      | type      |
      | title     | Title     |
      | data.type | data_type |
      | data.id   | data_id   |
#
#  Scenario: Verify bearer token authentication
#    Given I have a bearer token for user
#    And I set the request headers
#      | Bearer | bearer_token|
#    When I make a GET request to /example
#    Then response status code is 200
