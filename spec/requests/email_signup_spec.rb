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
end