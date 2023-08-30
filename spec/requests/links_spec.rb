require 'rails_helper'

RSpec.describe "LinksController", type: :request do
  
  it 'create a valid link' do
    url = 'https://www.google.com'
    shortener = Shortened.new(url)
    link = shortener.generate_link
    link.save
    expect(link.valid?).to be(true)
  end

  it 'failing to create with invalid link' do
    url = '34232324234'
    shortener = Shortened.new(url)
    link = shortener.generate_link
    link.save
    expect(link.valid?).to be(false)
  end

  it 'redirects to original url' do
    url = 'https://www.google.com'
    shortener = Shortened.new(url)
    link = shortener.generate_link
    get link.url_short
    expect(response).to redirect_to(link.original_url)
  end

  it 'show all available links' do
    link_one = Link.new(
      original_url: 'http://www.google.com',
      short_url: 'ABCDE'
    )

    link_one.save

    link_two = Link.new(
      original_url: 'http://www.facebook.com',
      short_url: 'BDCDF'
    )

    link_two.save


    expect(Link.all).to eq([link_one, link_two])
  end
end
