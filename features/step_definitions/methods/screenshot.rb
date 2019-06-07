module Screenshot

  def take_screenshot
    @browser.screenshot.save (Time.now.strftime("screenshots/%Y%m%d-%H%M%S")+"_screenshot.png")
  end

end