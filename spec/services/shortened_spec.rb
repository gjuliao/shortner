require 'rails_helper'

RSpec.describe Shortened do
    it 'check if code has 5 char length' do
        url = 'https://www.example.com'
        short = Shortened.new(url)
        expect(short.short_url.length).to eq(5)
    end

    it 'code must be 5 characthers and all Capitalize' do
        url = 'https://www.example.com'
        short = Shortened.new(url)
        code = short.short_url
        expect(code.length).to eq(5)
        expect(code).to match(/\A[A-Z]+\z/)
    end

    it 'does not contain special characters' do
        short = Shortened.new('https://www.example.com')
        code = short.short_url
        expect(code).not_to match(/[^A-Z]/)
    end

    it 'does not contain whitespace characters' do
        short = Shortened.new('https://www.example.com')
        code = short.short_url
        expect(code).not_to match(/\s/)
    end

    it 'validates uniqueness of codes' do
        short = Shortened.new('https://www.example.com')
        code_one = short.short_url

        short = Shortened.new('https://www.example-two.com')
        code_two = short.short_url
        expect(code_one).not_to eq(code_two)
    end

    it 'generates a unique link' do
        url = 'https://www.example.com'
        short = Shortened.new(url)
        link = short.generate_link
        expect(link.valid?).to be(true)
    end
end