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

  context 'post' do
    it 'can post article' do
      visit top_path
      fill_in 'name', :with => user
      click_button 'login'
      click_button 'New article'
      fill_in 'article_title', :with => 'sample-title'
      fill_in 'article_content', :with => 'sample-body'
      click_button 'Create article'
      page.should have_css('h2.article_title', :text => 'sample-title')
      page.should have_css('.attributes', :text => user)
    end
  end
end
