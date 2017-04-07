feature 'password confirmation' do

  scenario 'user is prevented from using mismatching passwords' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in('email', with: 'banana@gmail.com')
    fill_in('password', with: '123banana')
    fill_in('password_confirmation', with: '123orange')
    click_button('Sign up')
    expect { sign_up_mismatch }.not_to change(User, :count)
  end
end
