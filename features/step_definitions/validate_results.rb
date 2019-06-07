require_relative 'methods/results'
require_relative 'methods/screenshot.rb'

include ValidateResults
include Screenshot


Then(/^The user should see the results by the search criteria$/) do
  check_results
  destination_result
end

And(/^The results should be ordered by ascending price$/) do
  ordered_results
end

And(/^The results can be filtered by price$/) do
  filter_results
  take_screenshot
end

