module SearchCriteria

  def destination_search(destination)
    @destination = destination
    destination__criteria = @browser.button('aria-label': @destination + " ")

    @browser.li(class:%w(cdc-filters-tab cdc-filters-tab--destinations)).click
    @browser.div(class:"cdc-filter-body").wait_until_present
    sleep 1

    if destination__criteria.present?
      destination__criteria.click
    else
      puts @destination + " is not a supported destiny, please select another destination."
    end

  end

  def duration_search(duration)
    duration_criteria = @browser.button('aria-label': duration + " ")

    @browser.li(class:%w(cdc-filters-tab cdc-filters-tab--durations)).click
    @browser.div(class:"cdc-filter-body").wait_until_present
    sleep 1

    if duration_criteria.present? && duration_criteria.enabled?
      duration_criteria.click
    elsif !duration_criteria.enabled?
      puts duration + " is not a supported duration for the selected destination, please select another time frame."
    else
      puts duration + " is not a supported duration, please select another time frame."
    end
    sleep 1

  end

end