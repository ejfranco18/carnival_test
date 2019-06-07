require 'watir'

Selenium::WebDriver::Chrome.driver_path = PATH + "/drivers/chromedriver"
Selenium::WebDriver::Firefox.driver_path = PATH + "/drivers/geckodriver"

Before do
  @browser = Watir::Browser.new :chrome, options: {options: {detach: true}}
  # @browser = Watir::Browser.new :firefox
end

After do
  @browser.close
end