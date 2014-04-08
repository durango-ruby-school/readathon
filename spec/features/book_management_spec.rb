require "spec_helper"

feature "Book management" do
  scenario "User manages books" do
    visit root_path
    click_link "Books"
    
    add_book_with_title "Garfield"
    user_sees_flash_message "successfully created"
    user_sees_book_title "Garfield"
    
    edit_book_title "Calvin and Hobbes"
    user_sees_flash_message "successfully updated"
    user_sees_book_title "Calvin and Hobbes"
    
    click_link "Delete"
    user_sees_flash_message "successfully deleted"
  end
  
  scenario "user tries to save an invalid book" do
    visit new_book_path
    
    fill_in "Pages", with: "200"
    save
    
    expect(page).to_not have_content "successfully created"
    
    fill_in "Title", with: "Star Wars"
    save
    
    user_sees_flash_message "successfully created"
  end
  
  scenario "user looks for all books" do
    # Create a few books
    FactoryGirl.create_list :book, 3
    # Look at the page
    visit books_path
    # Make sure the books show up
    expect(page).to have_css ".book", count: 3
  end
  
  def user_sees_flash_message msg
    expect(page).to have_content msg
  end
  
  def save
    find("input[type=submit]").click
  end
  
  def add_book_with_title title
    click_link "Add book"
    fill_in "Title", with: title
    fill_in "Pages", with: "250"
    save
  end
  
  def edit_book_title title
    click_link "Edit"
    fill_in "Title", with: title
    save
  end
  
  def user_sees_book_title title
    expect(page).to have_content title
  end
end