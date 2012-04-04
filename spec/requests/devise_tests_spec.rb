require 'spec_helper'

describe "DeviseTests" do
  it "navigates to the login page successfully" do
  	visit '/users/sign_in'
  	page.should have_content("Forgot your password?")
  end
  
  it "logs in successfully when given right credentials" do
  	user = Factory(:user, :username => "Test", :password => "abc123", :email => "test@example.com")
  	visit '/users/sign_in'
  	fill_in "Username", :with => "Test"
  	fill_in "Password", :with => "abc123"
  	
  	click_button "Sign in"
  	
  	page.should have_content("Hello, world!")
  end
  
  it "logs in unsuccessfully when given bad credentials" do
  	user = Factory(:user, :username => "Test", :password => "abc123", :email => "test@example.com")
  	visit '/users/sign_in'
  	fill_in "Username", :with => "abc123"
  	fill_in "Password", :with => "Test"
  	
  	click_button "Sign in"
  	
  	page.should have_content("Invalid username or password.")
  end
  
end
