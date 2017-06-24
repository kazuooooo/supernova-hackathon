class UsersController < ApplicationController
  def profile
    @phenotypes = User.find(params[:id]).get_phenotypes
  end

  def match

  end
end
