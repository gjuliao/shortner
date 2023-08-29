class Shortened

    attr_reader :url

    def initialize(url)
        @url = url
    end

    def generate_link
        Link.create(original_url: url, short_url: short_url)
    end

    def short_url
        ('A'..'Z').to_a.sample(5).join
    end
end