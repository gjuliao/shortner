require 'rails_helper'

RSpec.describe "Clicks", type: :request do
  it "create click" do
    link = Link.create(
      original_url: 'http://www.google.com',
      short_url: 'ABCDE'
    )

    click = link.clicks.new
    

    click.save

    expect(click.valid?).to be(true)
  end
end
