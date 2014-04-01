require "spec_helper"

feature "Book management" do
  scenario "User manages books" do
    visit root_path
    
    click_link "Books"
    click_link "Add book"
    
    fill_in "Title", with: "Garfield"
    fill_in "Pages", with: "250"
    
    click_button "Save"
    
    expect(page).to have_content "Garfield"
    expect(page).to_not have_content "Save"
  end
end