Carnival test by Javier Franco
=================

Test cases for search cruises on the Carnival site.

Used tools:

Ruby

Watir

Install
-------------

bundle install

Scenarios
-------------

Search cruise by destination and duration

Get information about a selected sail


Set search criteria
-------------

To define the destination and duration for the search, set the word on the file carnival.feature on the following lines:

    The user selects the destination to "The Bahamas"
    Selects a duration of "6 - 9 Days"
    
The destination and duration must be the same available in the dropdown on the site.    

Test execution
--------------

Use cucumber command to execute the feature file, this will run both test cases:

    cucmuber features/carnival.feature

To execute just one test case, at the end of the command line set the number line of the scenario to run on the feature file:


    cucmuber features/carnival.feature:11


Set browser
--------------

To change the browser for the test execution, change the browser name on the file hooks.rb line 7.

  @browser = Watir::Browser.new :chrome, options: {options: {detach: true}}
  @browser = Watir::Browser.new :firefox
  
  
Screenshots
--------------

Screenshots can be taken with the method take_screenshot, they're stored on the folder screenshots.