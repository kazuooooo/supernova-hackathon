class AwakensClient

  attr_accessor :client, :token

  TOKEN_URL = 'https://genomicexplorer.io/v0/api-token-auth/'
  FOOD_CATEGORY  = 'food-and-nutrition'

  def initialize(user)
    @client  = HTTPClient.new
    payload  = {
        username: user.name,
        password: user.password
    }
    response = client.post TOKEN_URL, body: payload
    @token   = JSON.parse(response.body)['token']
  end

  def get_phenotypes
    phenotypes = get_category_phenotype_list(FOOD_CATEGORY)
    phenotypes.map { |phenotype| get_phenotype(phenotype) }
  end

  def get_phenotype(phenotype)
    response  = client.get report_url(phenotype), {}, header
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def get_category_phenotype_list(category_name)
    res = client.get category_url(category_name), {}, header
    ops = JSON.parse(res.body, object_class: OpenStruct)
    ops.phenotypes.map{|p| p.name}
  end

  private
  def header
    {
        Authorization: "JWT #{token}"
    }
  end

  def report_url(phenotype)
    "https://genomicexplorer.io/v0/reports/#{phenotype}/"
  end

  def category_url(category_name)
    "https://genomicexplorer.io/v0/reports/?category=#{category_name}"
  end

end