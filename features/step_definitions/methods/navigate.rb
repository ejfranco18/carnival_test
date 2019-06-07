module GlobalMethods

  def goto_site(site)
    @browser.goto site
  end

  def close_modal
    if @browser.div(class:"vifp-sweeps-modal").present?
      @browser.span(class:"vifp-sweeps-modal-close").click
    end
  end

end