class ShopClient
  include Singleton
  attr_accessor :client

  def initialize
    @client  = HTTPClient.new
  end

  def search_keywords(keywords)
    keywords = ["肉", "魚"]
    keywords.map { |keyword| search_keyword(keyword) }.flatten
  end

  def search_keyword(keyword)
    response = client.get url(keyword)
    JSON.parse(response.body, object_class: OpenStruct).results.shop
  end

  def url(keyword )
    URI.encode("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=ca50732adf405e08&keyword=#{keyword}&range=5&lat=35.6&lng=139.7&format=json")
  end
end