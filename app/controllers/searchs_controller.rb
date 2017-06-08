class SearchsController < ApplicationController
  def index
    keyword = params[:search][:keyword]
    if keyword.present?
      @users = User.search keyword
      @products = User.search keyword
    end
  end
end
