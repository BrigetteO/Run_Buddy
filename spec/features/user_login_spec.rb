require 'rails_helper'

describe "the signin/out process", :type => :feature, js: true do
  before :each do
    User.find_or_create_by(first_name: 'Brigette') do |user|
               user.last_name = 'Osha'
               user.user_name = 'bosha'
               user.email = 'bosha10@gmail.com'
               user.password = '123456'
               user.age = 28
               user.gender = 'female'
               user.city = 'Carlsbad'
               user.state = "CA"
               user.zipcode = 92008
               user.pace = 7.00
               user.availability = "evenings"
               user.run_pref = "beach"
               user.buddy_pref = true
    end
  end 

  it "signs me in" do
    visit new_user_session_path
      fill_in 'Email', with: 'bosha10@gmail.com'
      fill_in 'Password', with: '123456'
    click_button 'Login'
    expect(page).to have_content 'Hi, Brigette'
  end

  # it "signs me out" do
  #   visit '/profiles/1'
  #   page.find('.log_out').click
  #   expect(page).to have_content 'Sign up'
  # end

end