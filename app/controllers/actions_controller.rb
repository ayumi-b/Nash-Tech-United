class ActionsController < ApplicationController

  def new
    @user = User.find(params[:user])
  end

  def create
    @user = User.new(user_params)
  end
end
