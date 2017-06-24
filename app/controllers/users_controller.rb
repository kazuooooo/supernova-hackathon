class UsersController < ApplicationController
  def profile
    @phenotypes = User.find(params[:id]).get_phenotypes
  end

  def match
    users = params[:users]
    user_phenotypes = User.all.map{|user| user.get_phenotypes}
    @calc_result = Calculator.instance.sum(user_phenotypes)
    keywords    = Detector(calc_result)
    @json = ShopClient.search(keywords)
  end
end
