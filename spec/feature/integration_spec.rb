# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'doesnt matter'
    fill_in "book[price]", with: '10.00'
    fill_in 'book[publish_date]', with: "1990-12-31"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: ''
    fill_in "book[author]", with: 'doesnt matter'
    fill_in "book[price]", with: '10.00'
    fill_in 'book[publish_date]', with: "1990-12-31"
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'invalid author' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: ''
    fill_in "book[price]", with: '10.00'
    fill_in 'book[publish_date]', with: '1990-12-31'
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: 'doesnt matter'
    fill_in "book[price]", with: ''
    fill_in 'book[publish_date]', with: '1990-12-31'
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'invalid publish date' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: 'doesnt matter'
    fill_in "book[price]", with: '10.00'
    click_on 'Create Book'
    expect(page).to have_content("Publish date can't be blank")
  end
end