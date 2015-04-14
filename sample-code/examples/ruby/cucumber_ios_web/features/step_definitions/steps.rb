# These are the 'step definitions' which Cucumber uses to implement features.
#
# Each step starts with a regular expression matching the step you write in
# your feature description.  Any variables are parsed out and passed to the
# step block.
#
# The instructions in the step are then executed with those variables.
#
# The '$driver' object is the appium_lib driver, set up in the cucumber/support/env.rb
# file, which is a convenient place to put it as we're likely to use it often.
# For more on step definitions, check out the documentation at
# https://github.com/cucumber/cucumber/wiki/Step-Definitions




Given(/^I am on guniapig home page$/) do
  Selenium::WebDriver::Wait.new(timeout:3,message:'Home page does not launch').until {
    @browser.title.start_with?'I am a page title'
  }
end


When(/^I have entered ([^"]*) into Email field$/) do |value|
  @browser.find_element(id:'fbemail').send_keys(value)
  Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into email').until {
    @browser.find_element(id:'fbemail').attribute('value').eql?value
  }
end

And(/^I have entered ([^"]*) into Comments field$/) do |value|
  @browser.find_element(id:'comments').send_keys(value)
  Selenium::WebDriver::Wait.new(timeout:2,message:'Text not entered into comments').until {
    @browser.find_element(id:'comments').attribute('value').eql?value
  }
end



And(/^I click on ([^"]*)$/) do |va|
  element = @browser.find_element(id:va)
  raise 'No link found' unless element.displayed?
  element.click
  Selenium::WebDriver::Wait.new.until {
    @browser.title.start_with?'I am another page title'
  }
end

Then(/^I am on other page$/) do
  element = @browser.find_element(id:'i_am_an_id')
  raise "Doesn't open next page" unless element.text.eql?'I am another div'
end