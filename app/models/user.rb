class User < ApplicationRecord
  def get_phenotypes
    unless phenotypes
      client = AwakensClient.new(self)
      json = client.get_phenotypes.to_json
      update!(phenotypes: json)
    end
    JSON.parse(phenotypes, object_class: OpenStruct)
  end
end
