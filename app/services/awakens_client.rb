class AwakensClient

  include Singleton

  attr_accessor :client, :token

  TOKEN_URL = 'https://genomicexplorer.io/v0/api-token-auth/'
  CATEGORY  = 'food-and-nutrition'

  def initialize
    @client  = HTTPClient.new
    payload  = {
        username: 'g-supernova-a1',
        password: '6yudwn9Lc6bna'
    }
    response = client.post TOKEN_URL, body: payload
    @token   = JSON.parse(response.body)['token']
  end

  def get_phenotypes
    phenotypes = get_category_phenotype_list(CATEGORY)
    phenotypes.map { |phenotype| get_phenotype(phenotype) }
  end

  def get_phenotype(phenotype)
    phenotype = 'eye-color'
    response  = client.get report_url(phenotype), {}, header
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def get_category_phenotype_list(category_name)

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
    "https://genomicexplorer.io/v0/reports/#{category_name}"
  end

end