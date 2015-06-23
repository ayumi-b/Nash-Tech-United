feature "User Signs Up" do

  background do
    visit root_path
    click_on "I'll Take the Pledge!"
  end

  scenario "Happy Path With No Bio" do
    page.should_not have_link("Sign Up")
    fill_in "Name", with: "Kit"
    fill_in "Email", with: "kit@kat.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign up"
    visit new_user_action_path(:id => @user_id)
  end
end
