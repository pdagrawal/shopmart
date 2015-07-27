class UsersController < ApplicationController
  def all_orders_of_a_user
    @orders = User.find(params[:id]).orders
  end
end