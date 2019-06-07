require_relative 'methods/results'
require_relative 'methods/screenshot.rb'
require_relative 'methods/random_result'

include ValidateResults
include Screenshot
include RandomResult


When(/^The user selects one random result$/) do
  check_results
  destination_result
  select_random_result
end