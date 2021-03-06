require 'rails_helper'

#As a user
#I want to be able to save a bookmark
#So that I can refer to it later

feature 'create bookmark' do
	
	scenario 'successfully' do
		visit bookmarks_path
		click_link 'New Bookmark'
		fill_in 'Title', with: 'New Bookmark'
		fill_in 'Url', with: 'www.coolwebsite.com'
		click_button 'Create Bookmark'

		expect(page).to have_content('Bookmark was successfully created')
	end

end