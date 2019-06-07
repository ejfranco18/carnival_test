require_relative 'methods/search_criteria.rb'
require_relative 'methods/screenshot.rb'

include SearchCriteria
include Screenshot

When(/^The user selects the destination to "([^"]*)"$/) do |destination|
  destination_search(destination)
end

And(/^Selects a duration of "([^"]*)"$/) do |duration|
  duration_search(duration)
end