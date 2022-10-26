# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page' do
  describe 'user visits landing page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

    it 'shows landing page information' do
      visit root_path

      expect(page).to have_content('Viewing Party Lite')
      click_button 'Create New User'
      expect(current_path).to eq(new_user_path)

      visit root_path

      within '#users-list' do
        expect(page).to have_content(@users_1[0].email)
        expect(page).to have_content(@users_1[1].email)
        expect(page).to have_content(@users_1[2].email)
      end
    end
  end
end
