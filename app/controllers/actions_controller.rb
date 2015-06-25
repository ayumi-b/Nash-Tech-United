class ActionsController < ApplicationController
  # before_filter :load_action, except: [:index]
  # before_filter :load_user, except: [:new, :create]
  # before_action :require_login, except: [:index, :show]


  def new
    @user = User.find(current_user)
    @action = Action.new
  end

  def index
    @actions = Action.all
  end

  def create
    @action.user = current_user
    if @action.save
      redirect_to root_path, notice: "#{@action.goal} has been recorded"
    else
      flash.alert = "please recheck."
      render :new
    end
  end

  def destroy
    @action.destroy
    redirect_to new_user_action_path(current_user), notice: "#{current_user}'s action has been deleted."
  end
  # # def show
  # #   @comments = @post.comments.all
  # #   @comment = Comment.new
  # # end

  private


  def load_action
    if params[:current_user_id].present?
      @action = Action.find(params[:current_user_id])
    else
      @action = Action.new
    end
    if params[:action].present?
      @action.assign_attributes(action_params)
    end
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def action_params
    params.require(:actions).permit(:goal)
  end
end
