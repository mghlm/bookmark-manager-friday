feature 'see links' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.scrubs.com', title: 'Scrubs', tags: [Tag.first_or_create(name: 'TV')])
    Link.create(url: 'http://www.mozart.com', title: 'Mozart', tags: [Tag.first_or_create(name: 'Culture')])
    Link.create(url: 'http://www.paris.com', title: 'Paris', tags: [Tag.first_or_create(name: 'Travel and Fun')])
  end

  scenario 'user can see a list of links on homepage' do
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'I can filter links by tag' do
    visit '/tags/TV'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Mozart')
      expect(page).not_to have_content('Paris')
      expect(page).to have_content('Scrubs')
    end
  end

end
