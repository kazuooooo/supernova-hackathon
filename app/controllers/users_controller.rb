class UsersController < ApplicationController

  def register

  end

  def profile
    @phenotypes = User.find(params[:id]).get_phenotypes
  end

  def survey
    @inherited_params_users = params["users"]
  end

  def match

  end

  def result
    users           = if params["users"]
                        params["users"].map(&:to_i)
                      else
                        3.times.map do
                          rand(1..10)
                        end
                      end
    user_phenotypes = User.find(users).map { |user| user.get_phenotypes }
    @calc_result    = Calculator.instance.sum(user_phenotypes)
    keywords        = Detector.instance.detect(@calc_result)
    @shops          = ShopClient.instance.search_keywords(keywords.map { |elem| elem.keys }.flatten)
    @keys = @shops.first.to_h.keys
  end
end
