require 'nokogiri'
require 'net/http'

module Cheapwish
  # This contains the xpath, and other logic needed to construct objects from
  # html
  # @author psyomn
  class Scraper
    WishlistUrl = "http://steamcommunity.com/id/%s/wishlist"
    GameXPath = "//div[contains(@id, 'game_')]"
    def initialize(username_s)
      @username = username_s
    end

    def scrape
      html = fetch_html
      @doc = Nokogiri::HTML(html)
      games = @doc.xpath(GameXPath)
      puts "Found #{games.to_a.count} game(s)"
      games.each do |node|
        puts node.xpath(".//div[@class='wishlistRowItem']/h4/text()").to_s.strip
        puts "  " + node.xpath(".//div[@class='gameListRowLogo']/a/@href").to_s.strip

        price_node = node.xpath(".//div[@class='gameListPriceData']")
        discounts = price_node.xpath(".//div[@class='discount_block']/div[@class='discount_pct']")

        if discounts.empty?
          p discounts
          puts "  no discounts"
          puts "  " + price_node.xpath(".//div/text()").to_s.strip
        else
          puts "  discounts detected!"
        end
      end
    end

    private

    def fetch_html
      url = WishlistUrl % @username
      uri = URI(url)
      Net::HTTP.get(uri)
    end
  end
end
