module LoginModule
  def login(user)
    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password'
    click_button 'Login'
  end
end
