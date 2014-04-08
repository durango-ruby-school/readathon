require "spec_helper"

feature "Book management" do
  scenario "User manages books" do
    visit root_path
    
    click_link "Books"
    click_link "Add book"
    
    fill_in "Title", with: "Garfield"
    fill_in "Pages", with: "250"
    
    click_button "Save"
    
    expect(page).to have_content "successfully created"
    
    click_link "Edit"
    fill_in "Title", with: "Calvin and Hobbes"
    click_button "Save"
    
    expect(page).to have_content "successfully updated"
    expect(page).to have_content "Calvin and Hobbes"
    
    click_link "Delete"
    expect(page).to have_content "successfully deleted"
  end
end