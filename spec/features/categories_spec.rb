require 'rails_helper'
RSpec.describe 'Creating Categories', type: :feature do
    before :each do
        user = User.create( id:1,firstname: 'Roni',lastname: 'Abou Nassif',email:'roni@gmail.com',password:'foobar')
        visit new_user_session_path
        fill_in 'Email', with: 'roni@gmail.com'
        fill_in 'Password', with: 'foobar'
        click_on 'Log in'
        visit categories_path
    end
    scenario 'Successful category creation' do
        click_on "New Category"
        visit new_category_path
        fill_in 'Name', with: 'Category'
        click_on 'Add Category'
        visit categories_path
        expect(page).to have_content('Category')
      end
      scenario 'blank name category creation' do
        click_on "New Category"
        visit new_category_path
        fill_in 'Name', with: ''
        click_on 'Add Category'
        expect(page).to have_content("Name can't be blank")
      end
      scenario 'blank name category creation' do
        Category.create(name:"Cat",creator_id:1)
        click_on "New Category"
        visit new_category_path
        fill_in 'Name', with: 'Cat'
        click_on 'Add Category'
        expect(page).to have_content("Name has already been taken")
      end
end