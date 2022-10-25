# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Register Page' do
  describe 'user visits the registration page' do
    before :each do
      @users_1 = create_list(:user, 20)
    end

    it 'shows a form to input credentials then takes you to user dashboard' do
      visit '/register/new'

      expect(page.has_field?).to eq(true)
      fill_in 'Name:', with: "Erik"
      fill_in 'Email:', with: "erik@erik.com"
      fill_in 'Password:', with: "Password1234!"
      fill_in 'Confirm password:', with: "Password1234!"
      click_button('Register')

      expect(current_path).to eq(user_path(@users_1.last.id + 1))
      expect(page).to have_content("Erik profile successfully created")
    end

    it 'redirects to /register/new if info is not complete' do
      visit '/register/new'

      expect(page.has_field?).to eq(true)
      fill_in 'Name:', with: 'Sandy M'

      click_button('Register')

      expect(current_path).to eq('/register/new')
    end

    it 'redirects to /register/new if info passwords do not match' do
      visit '/register/new'

      expect(page.has_field?).to eq(true)
      fill_in 'Name:', with: 'Sandy M'
      fill_in 'Email:', with: 'Sandy@google.com'
      fill_in 'Password:', with: 'Pasword12345!'
      fill_in 'Confirm password:', with: 'Pasword1234!'
      click_button('Register')


      expect(current_path).to eq('/register/new')
    end
  end
end
