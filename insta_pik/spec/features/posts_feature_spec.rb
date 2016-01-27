require 'rails_helper'

feature 'posts' do
  context 'initial visit of site' do
    scenario 'should show that there are no posts' do
      visit '/posts'
      expect(page).to have_content('No Posts Yet')
    end
    scenario 'should show a prompt to add a post' do
      visit '/posts'
      expect(page).to have_link('Post!')
    end
  end
  # context 'adding a post' do
  #   scenario 'site displays added post on submit' do
  #     visit '/posts'
  #     click_link('Post!')
  #   end
  # end
end
