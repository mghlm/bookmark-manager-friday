feature 'password confirmation' do

  scenario 'user is prevented from using mismatching passwords' do
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in('email', with: 'banana@gmail.com')
    fill_in('password', with: '123banana')
    fill_in('password_confirmation', with: '123orange')
    click_button('Sign up')
    expect { sign_up_mismatch }.not_to change(User, :count)
    expect(current_path).to eq ('/user')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
