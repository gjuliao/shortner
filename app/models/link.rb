class Link < ApplicationRecord
    has_many :clicks
    validates_uniqueness_of :short_url
    validates_presence_of :original_url, :short_url
    validate :original_url_format
    validate :short_url_format

    def original_url_format
        uri = URI.parse(original_url || '')
        if uri.host.nil?
            errors.add(:invalid_URL, 'Please use a valid URL')
        end
    end

    def short_url_format
        unless short_url.match?(/\A[A-Z]{5}\z/)
            errors.add(:short_url, "must be 5 characters long and consist of capital letters")
        end
    end

    def url_short
        "https://localhost:3000/#{short_url}"
    end
end
