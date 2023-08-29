class Link < ApplicationRecord
    validates_uniqueness_of :short_url
    validates_presence_of :original_url, :short_url
    validate :original_url_format

    def original_url_format
        uri = Uri.parse(original_url || '')
        if uri.host.nil?
            errors.add(:original_url, 'Invalid url')
        end
    end
end
