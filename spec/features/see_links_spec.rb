feature 'see links' do
  scenario 'user can see a list of links on homepage' do
    visit ('/')
    expect(page).to have_content 'Link'
  end
end
