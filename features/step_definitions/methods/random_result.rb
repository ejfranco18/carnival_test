module RandomResult

  def select_random_result
    select_index = rand(0...@results.size)
    @selected_result = @results[select_index].span(class:"cgc-cruise-glance__main-text").text
    @results[select_index].a(class:"vrgf-learn-more__text").click
  end

end