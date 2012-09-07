require 'spec_helper'

describe 'User' do
  let(:user) {'tester'}
  context 'login' do
    it 'can login' do
      visit top_path
      fill_in 'name', :with => user
      click_button 'login'
      page.should have_content("Your name is #{user}")
    end
  end
end
