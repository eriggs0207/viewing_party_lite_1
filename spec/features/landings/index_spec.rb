# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
#   As a logged in user
# When I visit the landing page
# I no longer see a link to Log In or Create an Account
# But I see a link to Log Out.
# When I click the link to Log Out
# I'm taken to the landing page
# And I can see that the Log Out link has changed back to a Log In link

  describe 'logged in user visits the page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

    it 'shows log out link while currently logged in' do
      @user = create(:user)
      visit login_path

      fill_in :email, with: "#{@user.email}"
      fill_in :password, with: "#{@user.password}"

      click_on "Log In"
      visit root_path

      expect(page).to have_content('Viewing Party Lite')
      expect(page).to_not have_content('Log In')
      expect(page).to_not have_content('Create New User')
      click_on 'Log Out'
      expect(current_path).to eq(root_path)

      expect(page).to have_content('Log In')

    end
    it 'shows a list of user emails' do
      @user = create(:user)
      visit login_path

      fill_in :email, with: "#{@user.email}"
      fill_in :password, with: "#{@user.password}"

      click_on "Log In"

      visit root_path

      within '#users-list' do
        expect(page).to have_content(@users_1[0].email)
        expect(page).to have_content(@users_1[1].email)
        expect(page).to have_content(@users_1[2].email)
      end
    end
  end

  describe 'visitor visits the page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

    it 'does not show a list of users' do
      visit root_path

      expect(page).to_not have_content(@users_1[0].email)
      expect(page).to_not have_content(@users_1[1].email)
      expect(page).to_not have_content(@users_1[2].email)
    end
  end
end
