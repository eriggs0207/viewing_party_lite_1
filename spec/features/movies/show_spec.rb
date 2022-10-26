# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Movie Show Page' do
  describe 'user visits the movie show page' do
    before :each do
      @user_1 = create(:user)
      visit login_path

      fill_in :email, with: "#{@user_1.email}"
      fill_in :password, with: "#{@user_1.password}"

      click_on "Log In"
      movie = File.read('./spec/fixtures/fight_club.json')
      movie_data = JSON.parse(movie, symbolize_names: true)
      @fight_club = Movie.new(movie_data)

      cast = File.read('./spec/fixtures/fight_club_cast.json')
      cast_data = JSON.parse(cast, symbolize_names: true)
      @fight_club_cast = cast_data[:cast].map do |member|
        Cast.new(member)
      end[0..9]

      review = File.read('./spec/fixtures/fight_club_review.json')
      review_data = JSON.parse(review, symbolize_names: true)
      @fight_club_reviews = review_data[:results].map do |review|
        Review.new(review)
      end
    end

    it 'has a button to create a viewing party' do
      visit movie_path(@fight_club.id)
      click_button 'Create Viewing Party'
      expect(current_path).to eq(new_movie_party_path(@fight_club.id))
    end

    it 'has a button to return to discover page' do
      visit movie_path(@fight_club.id)

      click_button 'Discover Page'
      expect(current_path).to eq(discover_index_path)
    end

    it 'shows all the movie information' do
      visit movie_path(@fight_club.id)

      expect(page).to have_content(@fight_club.original_title)

      within('#movie-details') do
        expect(page).to have_content(@fight_club.genre_names[0])
        expect(page).to have_content(@fight_club.overview)
        expect(page).to have_content(@fight_club.standard_runtime)
        expect(page).to have_content(@fight_club.vote_average)
        expect(page).to have_content(@fight_club.vote_count)
      end

      within('#cast-details') do
        expect(page).to have_content(@fight_club_cast.last.name)
        expect(page).to have_content(@fight_club_cast.last.character)
      end

      within('#review-details') do
        expect(page).to have_content(@fight_club_reviews.first.author)
      end
    end
  end
end
