# As a user
# When I visit "/"
# And I select "Turing" from the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1min)
# - The HTML direction instructions to get to that fuel station
#   "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"
require 'rails_helper'

describe 'As a user searching for the nearest fuel station' do
  describe 'and I click FIND NEAREST STATION' do
    scenario 'takes to me to the search page' do
      visit '/'
      select "Turing", :from => :location
      click_on "Find Nearest Station"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Closest Fuel Station")

      within(".fuel-station") do
        expect(page).to have_css('#station-name')
        expect(page).to have_css('#station-address')
        expect(page).to have_css('#station-fuel-type')
        expect(page).to have_css('#station-access-times')
      end
    end

    scenario 'i see travel info to the nearest station' do
      visit '/'
      select "Turing", :from => :location
      click_on "Find Nearest Station"

      expect(current_path).to eq("/search")
      expect(page).to have_content("Closest Fuel Station")

      within(".travel-info") do
        expect(page).to have_css('#distance')
        expect(page).to have_css('#travel-time')
        expect(page).to have_css('#directions')
      end
    end
  end
end
