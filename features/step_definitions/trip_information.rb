require_relative 'methods/validate_trip_info'

include ValidateTripInfo

Then(/^The selected result page should be loaded$/) do
  validate_selected_trip
end

And(/^The info for each day should be display$/) do
  validate_day_info
end

And(/^The CTA for booking the trip should be available$/) do
  validate_book_cta
  take_screenshot
end