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
  context 'showing a post' do
    scenario 'site displays posts on homepage' do
      Post.create(caption: 'Caption')
      visit '/posts'
      expect(page).to have_content("Caption")
      expect(page).not_to have_content("No Posts Yet")
    end
  end
  context 'creating a post' do
    scenario "'Post!' link takes you to a form to add a caption on a post" do
      visit '/posts'
      click_link('Post!')
      fill_in 'Caption', with: "Insta-Pik!"
      click_button('Create Post')
      expect(page).to have_content("Insta-Pik!")
      expect(page).not_to have_content("No Posts Yet")
      expect(current_path).to eq '/posts'
    end
  end
end
