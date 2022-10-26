# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Discover Page' do
  describe 'user visits the discover page' do
    before :each do
      @user_1 = create(:user)
      visit new_session_path

      fill_in :email, with: "#{@user_1.email}"
      fill_in :password, with: "#{@user_1.password}"

      click_on "Log In"
    end
    it 'shows a button to Discover Top Rated movies' do
      visit discover_index_path

      click_button 'Top Rated Movies'
      expect(current_path).to eq(movies_path)
    end

    it 'shows a search field to enter movie keywords plus a button to search by movie title' do
      visit discover_index_path
      fill_in 'Search by movie title', with: 'Shawshank Redemption'
      click_button 'Find Movies'
      expect(current_path).to eq(movies_path)
    end
  end
end
