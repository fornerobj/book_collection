# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(Book, type: :model) do
  subject(:book) do
    described_class.new(
      title: 'Anything',
      author: 'Anything',
      price: 10.00,
      publish_date: Time.zone.today
    )
  end

  it 'is valid with valid attributes' do
    expect(book).to(be_valid)
  end

  it 'is not valid without a name' do
    book.title = nil
    expect(book).not_to(be_valid)
  end

  it 'is not valid without an author' do
    book.author = nil
    expect(book).not_to(be_valid)
  end

  it 'is not valid without a price' do
    book.price = nil
    expect(book).not_to(be_valid)
  end

  it 'is not valid without a publish date' do
    book.publish_date = nil
    expect(book).not_to(be_valid)
  end
end
