require 'rails_helper'

RSpec.describe 'Discover Page' do
  describe 'user visits the discover page' do

#     As an user,
# When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
# I should see

#   Button to Discover Top Rated Movies
#   A text field to enter keyword(s) to search by movie title
#   A Button to Search by Movie Title
# Details When the user clicks on the Top Rated Movies OR the search button, they should be taken to the movies results page (more details of this on the Movies Results Page issue.
    xit 'shows a button to Discover Top Rated movies' do
      visit user_discover_path

      click_button 'Top Rated Movies'
      expect(current_path).to eq(user_movies_path) #may need to recheck route
    end

    xit 'shows a search field to enter movie keywords plus a button to search by movie title' do
      visit user_discover_path

      click_button 'Top Rated Movies'
      expect(current_path).to eq(user_movies_path)
    end
  end
end
