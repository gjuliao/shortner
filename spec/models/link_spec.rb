require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'check if url link is valid' do
    link = Link.new(
      original_url: 'https://www.google.com',
      short_url: 'ABCDE'
    )
    link.save
    expect(link.valid?).to be(true)
  end

  it 'invalid if url is fake' do
    link = Link.new(
      original_url: 'asdfasdfasdfasdfasdf',
      short_url: 'ABCDE'
    )
    expect(link.valid?).to be(false)
  end

  it 'invalid if short_url is not well formated is fake' do
    link = Link.new(
      original_url: 'https://www.google.com',
      short_url: 'abcdef'
    )
    expect(link.valid?).to be(false)
  end

  
end
