require_relative 'methods/navigate.rb'

include GlobalMethods

Given(/^The user is on the Carnival site$/) do
  site = "https://www.carnival.com/"
  goto_site(site)
  close_modal
end