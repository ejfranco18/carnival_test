module ValidateTripInfo

  def validate_selected_trip
    displayed_result = @browser.span(class:%w(itin-name main-span ng-binding ng-scope))

    if displayed_result.present?
      unless displayed_result.text.downcase == @selected_result.downcase
        puts "The displayed result is different from the selected"
        fail
      end
    else
      puts "The result is not displayed"
      fail
    end
  end

  def validate_day_info
    day_info = @browser.divs(class:"itinerary-day-tile")
    day_detail = @browser.div(class:%w(itinerary-details ng-scope)).div(class:%w(slide ccl-negative-outline slick-slide slick-current slick-active)).h2

    i=1
    while i < day_info.size do
      if day_info[i].p(class:"day").present?
        puts day_info[i].p(class:"day").text.gsub /(?<!\n)\n(?!\n)/, ' '
        day_info[i].button(class:"about-cta").click
        sleep 2
        puts day_detail.text
      else
        puts "The trip info is not available."
        fail
      end
      i+=1
    end

  end

  def validate_book_cta
    book_button = @browser.a('aria-label': "Book Now")

    unless book_button.present?
      puts "The Book Now CTA is not present."
      fail
    end
  end

end