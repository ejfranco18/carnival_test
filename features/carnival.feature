Feature: Search on the Carnival site

  Scenario: Search cruise by destination and duration
    Given The user is on the Carnival site
    When The user selects the destination to "The Bahamas"
    And Selects a duration of "6 - 9 Days"
    Then The user should see the results by the search criteria
    And The results should be ordered by ascending price
    And The results can be filtered by price