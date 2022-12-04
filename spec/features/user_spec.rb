require 'rails_helper'
describe 'User Actions', type: :feature do
before :each do
  User.create(email: 'roni@gmail.com', password: 'password', firstname: 'Roni',lastname: 'Abou Nassif')
end
scenario 'user log in successfully' do
  visit new_user_session_path
  fill_in 'Email', with: 'roni@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
 expect(current_path).to eq(root_path)
 expect(page).to have_text('Signed in successfully.')
end
scenario 'user logs out' do
  visit new_user_session_path
  fill_in 'Email', with: 'roni@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  click_on 'Logout'
  expect(page).to have_content('Signed out successfully.')
end
scenario 'User fails trying to log in with invalid email' do
  visit new_user_session_path
  fill_in 'Email', with: 'any@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  expect(page).to have_content('Invalid Email or password')
end
scenario 'User fails trying to log in with invalid password' do
  visit new_user_session_path
  fill_in 'Email', with: 'roni@gmail.com'
  fill_in 'Password', with: 'anypas'
  click_button 'Log in'
  expect(page).to have_content('Invalid Email or password')
end
scenario 'creating a user successfully' do
  visit new_user_registration_path
  fill_in 'Firstname', with: 'Roni'
  fill_in 'Lastname', with: 'AN'
  fill_in 'Email', with: 'ron@gmail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_on 'Sign up'
  expect(page).to have_content("Welcome! You have signed up successfully")
end
end