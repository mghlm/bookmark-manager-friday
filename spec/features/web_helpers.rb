def create_link
  visit '/links/new'
  fill_in :title, with: 'google'
  fill_in :url, with: 'google.co.uk'
  fill_in :tags, with: 'search'
  click_button 'Add link'
end

def sign_up
  visit '/user/new'
  expect(page.status_code).to eq(200)
  fill_in('email', with: 'banana@gmail.com')
  fill_in('password', with: '123banana')
  fill_in('password_confirmation', with: '123banana')
  click_button('Sign up')
end

def sign_up_mismatch
  visit '/user/new'
  expect(page.status_code).to eq(200)
  fill_in('email', with: 'banana@gmail.com')
  fill_in('password', with: '123banana')
  fill_in('password_confirmation', with: '123orange')
  click_button('Sign up')
end
