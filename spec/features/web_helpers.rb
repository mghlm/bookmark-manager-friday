def create_link
  visit '/links/new'
  fill_in :title, with: 'google'
  fill_in :url, with: 'google.co.uk'
  fill_in :tags, with: 'search'
  click_button 'Add link'
end
