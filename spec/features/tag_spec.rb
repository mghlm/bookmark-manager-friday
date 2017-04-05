feature 'tag field' do
  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'google'
    fill_in 'tags', with: 'search engine'

    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search engine')
    end

end
