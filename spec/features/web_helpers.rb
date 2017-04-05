def create_link
  visit '/links/new'
  fill_in :title, with: 'google'
  fill_in :url, with: 'google.co.uk'
  click_button 'Add link'
end
