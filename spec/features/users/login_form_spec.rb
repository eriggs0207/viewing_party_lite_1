require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = create(:user, name: "Frank", email: "frank@cat.com", password: "Password1234!")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.name}")
  end

    it "cannot log in with bad credentials" do
      user = create(:user, name: "Frank", email: "frank@cat.com", password: "Password1234!")

      visit login_path

      fill_in :email, with: user.email
      fill_in :password, with: "incorrect password"

      click_on "Log In"

      expect(current_path).to eq(login_path)

      expect(page).to have_content("Password or email is incorrect")
  end
end
