class UsersController < ApplicationController
  def profile
    @phenotypes = User.find(params[:id]).get_phenotypes
  end

  def match
    users           = params[:users]
    #  user_phenotypes = users.map{|user| user.get_phenotypes}
    user_phenotypes = User.all.map { |user| user.get_phenotypes }
    @calc_result    = Calculator.instance.sum(user_phenotypes)
    keywords        = Detector.instance.detect(@calc_result)
    @shops           = ShopClient.instance.search_keywords(keywords.map{|elem| elem.keys}.flatten)
    @keys           = @shops.first.to_h.keys
  end
end
