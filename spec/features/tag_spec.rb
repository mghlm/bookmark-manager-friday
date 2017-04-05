feature 'tag field' do
  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in :title, with: 'google'
    fill_in :url, with: 'google.co.uk'
    fill_in :tags, with: 'search engine'
    click_button 'Add link'
    within 'ul#links' do
      expect(page).to have_content("search engine")
    end
  end
end
