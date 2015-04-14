

class GuniaPig

  def initialize(web_browser)
    @browser = web_browser
  end

  def await
    Selenium::WebDriver::Wait.new(timeout:3).until { @browser.title.start_with?'I am a page title'  }
    self
  end

  def enter_email(email)
    @browser.find_element(id:'fbemail').send_keys(email)
    Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into email').until {
      @browser.find_element(id:'fbemail').attribute('value').eql?email
    }
  end

  def enter_comments(comment)
    @browser.find_element(id:'comments').send_keys(comment)
    Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into comments').until {
      @browser.find_element(id:'comments').attribute('value').eql?comment
    }
  end

  def click_link(element_id)
    element = @browser.find_element(id:element_id)
    raise 'No link found' unless element.displayed?
    element.click
    Selenium::WebDriver::Wait.new.until {
      @browser.title.start_with?'I am another page title'
    }
    GuniaPig2.new(@browser).await
  end

end