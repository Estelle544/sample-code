require 'selenium/webdriver/common/wait'

class GuniaPig
  include PageObject

  text_field(:email,id:'fbemail')

  @driver = nil

  def initialize(web_driver)
    @driver = web_driver
  end

  def await
    Selenium::WebDriver::Wait.new(timeout:3).until { @driver.title.start_with?'I am a page title'  }
    self
  end

  def enter_email(email)
    @driver.find_element(id:'fbemail').send_keys(email)
    Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into email').until {
      @driver.find_element(id:'fbemail').attribute('value').eql?email
    }
  end

  def enter_comments(comment)
    @driver.find_element(id:'comments').send_keys(comment)
    Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into comments').until {
      @driver.find_element(id:'comments').attribute('value').eql?comment
    }
  end

  def click_link(element_id)
    element = @driver.find_element(id:element_id)
    raise 'No link found' unless element.displayed?
    element.click
    Selenium::WebDriver::Wait.new.until {
      @driver.title.start_with?'I am another page title'
    }
    GuniaPig2.new(@driver).await
  end

end