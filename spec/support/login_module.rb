module LoginModule
  def login(user)
    visit users_sign_in_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
  end
end
