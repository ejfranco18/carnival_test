module ValidateResults

  def check_results
    results_grid = @browser.element(class:"ccs-search-results")

    unless results_grid.present?
      puts "The results grid is not present"
      fail
    end

  end

  def destination_result
    @results = @browser.articles(class:%w(vrg-result-item vrg-result-item--result vrg-result-item--small))

    i=0
    while i < @results.size do
      unless (@results[i].span(class:"cgc-cruise-glance__main-text").text.downcase).include? (@destination.downcase)
        puts "The result doesn't contain the selected destination"
        puts @results[i].span(class:"cgc-cruise-glance__main-text").text
        fail
      end
      i+=1
    end

  end

  def ordered_results
    @prices = []

    i=0
    while i < @results.size do
      @prices.push(@results[i].span(class:"vrgf-price-box__price").text.gsub(/[^0-9]/, ''))
      i+=1
    end

    if @prices != @prices.sort
      puts "The results are not ordered by ascending price."
      fail
    end

  end

  def filter_results
    if @results.size >= 3
      min = @prices[0].to_i
      max = @prices[-1].to_i

      @browser.li(class:%w(sfn-nav__item sfn-nav__item-pricing)).click

      price_filter_min = @browser.span(class:%w(rz-pointer rz-pointer-min))
      price_filter_max = @browser.span(class:%w(rz-pointer rz-pointer-max))

      until price_filter_min.attribute_value("aria-valuenow").to_i > min+20 do
        price_filter_min.click
        @browser.send_keys :arrow_right
      end

      until price_filter_max.attribute_value("aria-valuenow").to_i < max-20 do
        price_filter_max.click
        @browser.send_keys :arrow_left
      end
    end

    sleep 4

    unless @results.size > @browser.articles(class:%w(vrg-result-item vrg-result-item--result vrg-result-item--small)).size
      puts "The results were NOT filtered"
      fail
    end

  end

end