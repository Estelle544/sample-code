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
#
# For more on rspec assertions, check out
# https://www.relishapp.com/rspec/rspec-expectations/docs



Given(/^I am on guniapig home page$/) do
  @page = GuniaPig.new(@browser)
  @page.await
end

 Given(/^I have entered ([^"]*) into Email field$/) do |email|
   @page.enter_email(email)
 end

 And(/^I have entered ([^"]*) into Comments field$/) do |comment|
   @page.enter_comments(comment)
 end

 When(/^I click on ([^"]*)$/) do |link|
   @page = @page.click_link(link)
 end

 Then(/^I am on other page$/) do
   raise "Doesn't open next page" unless @page.class.equal?GuniaPig2 and @page.am_an_id_text.eql?'I am another div'
 end


