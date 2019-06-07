Feature: Search on the Carnival site

  Scenario: Search cruise by destination and duration
    Given The user is on the Carnival site
    When The user selects the destination to "The Bahamas"
    And Selects a duration of "6 - 9 Days"
    Then The user should see the results by the search criteria
    And The results should be ordered by ascending price
    And The results can be filtered by price

  Scenario: Get information about a selected sail
    Given The user is on the Carnival site
    And The user selects the destination to "The Bahamas"
    When The user selects one random result
    Then The selected result page should be loaded
    And The info for each day should be display
    And The CTA for booking the trip should be available