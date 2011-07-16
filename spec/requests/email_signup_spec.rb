require 'spec_helper'

describe "E-mail signup" do

  context "Opening the page" do
    before do
      visit '/'
    end

    it "shows a e-mail field" do
      page.should have_selector('input[type=email]')
    end
  end
  
  context "Filling the email field" do
    before do
      @response = mock()
      @response.stub(:code => 201)
      visit '/'
      fill_in "email", :with => "test@mail.com"
    end
    
    it "sends the e-mail to app 2 when clicked" do
      RestClient.should_receive(:post).with("http://desafioapp2.heroku.com/users", {:email => "test@mail.com"}).and_return(@response)
      click_on "Send"
    end
    
    it "alerts the user" do
      RestClient.stub(:post).and_return(@response)
      click_on "Send"
      page.should have_content("E-mail cadastrado com sucesso")
    end
  end
end