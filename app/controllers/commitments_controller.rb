class CommitmentsController < ApplicationController
  # before_filter :load_action
  before_filter :load_user, except: [:index]
  before_action :authenticate_user!, :except => [:index, :show]


  def new
    @user = User.find(current_user)
    @action = Commitment.new
  end


  def index
    @commitments = Commitment.all
  end

  def create
    @commitment = current_user.commitments.build(params.require(:commitment).permit(:goal))
    if @commitment.save
      redirect_to root_path
      flash.notice = "#{@commitment.goal} has been recorded"
    else
      flash.alert = "please recheck."
      render "commitments/new"
    end
  end

  def destroy
    @commitment.destroy
    redirect_to action_path(current_user), notice: "#{current_user}'s commitment has been deleted."
  end


  private


  def load_commitment
    if params[:id].present?
      @commitment = Commitment.find(params[:id])
    else
      @commitment = Commitment.new
    end
    if params[:commitment].present?
      @commitment.assign_attributes(commitment_params)
    end
  end

  def load_user
    @user = User.find(current_user)
  end

  def commitment_params
    params.permit(:goal)
  end
end
