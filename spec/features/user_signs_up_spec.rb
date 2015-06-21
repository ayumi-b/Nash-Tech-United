feature "User Signs Up" do

  background do
    visit root_path
    click_on "Sign Up"
  end

  scenario "Happy Path With No Bio" do
    page.should_not have_link("Sign Up")
    fill_in "First Name", with: "Kit"
    fill_in "Last Name", with: "Kat"
    fill_in "Email", with: "kit@kat.com"
    fill_in "Password", with: "pass1"
    fill_in "Password confirmation", with: "pass1"
    click_button "Sign Up"
  end
end
