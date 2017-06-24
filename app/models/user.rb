class User < ApplicationRecord
  def get_phenotypes
    client = AwakensClient.new(self)
    client.get_phenotypes
  end
end
