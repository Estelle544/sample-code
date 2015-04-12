class GuniaPig2

  def initialize(web_driver)
    @driver = web_driver
  end

  def await
    Selenium::WebDriver::Wait.new(timeout:3).until { @driver.title.start_with?'I am another page title - Sauce Labs'  }
    self
  end

  def am_an_id_text
    @driver.find_element(id:'i_am_an_id').text
  end

end