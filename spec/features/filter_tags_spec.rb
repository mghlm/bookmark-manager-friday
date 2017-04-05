require_relative 'web_helpers'

feature 'filter tags' do

  scenario 'checks that only Links tagged with news are present' do
    create_link
    visit '/links/new'
    fill_in :title, with: 'bbc'
    fill_in :url, with: 'bbc.co.uk'
    fill_in :tags, with: 'news'
    click_button 'Add link'
    visit '/tags/news'
    expect(page).not_to have_content("search")
  end

end
