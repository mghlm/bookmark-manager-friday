feature 'tag field' do
  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'google'
    fill_in 'tags', with: 'search-engine'

    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search-engine')
    end

    scenario 'can add multiple tags to links in bookmark-manager' do
      visit '/links/new'
      fill_in 'url', with: 'http://theguardian.com'
      fill_in 'title', with: 'Newspaper'
      fill_in 'tags', with: 'news entertainment sport politics travel'
      click_button 'Add link'
      link = Link.first
      expect(link.tags.map(&:name)).to include('news', 'sport')
    end

end
