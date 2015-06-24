feature "User Signs Up" do

  background do
    visit root_path
    click_on "I'll Take the Pledge!"
  end

  scenario "Happy Path With Sign Up" do
    page.should_not have_link("Sign Up")
    fill_in "Name", with: "Kit"
    fill_in "Email", with: "kit@kat.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign up"
    page.should have_content("You have signed up successfully.")
  end

  scenario "Error Path" do
    fill_in "Name", with: ""
    fill_in "Email", with: "joeexample.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "food"
    click_on "Sign up"
    # page.should have_notification("Please review the problems below:")

    page.should have_error("is invalid", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")

    fill_in "Name", with: "Sally"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Sign up"
    page.should have_content("You have signed up successfully.")
  end
end