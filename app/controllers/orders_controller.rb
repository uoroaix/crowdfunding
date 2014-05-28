class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward_level

  def new
    @order = Order.new
  end

  def create

    service = Order::CreateOrder.new(user: current_user, stripe_token: params[:order][:stripe_card_token], reward_level: @reward_level)

    if service.call
      redirect_to @reward_level.campaign, notice: "Thanks for pleding"
    else
      @order = service.order
      render :new
    end


  end

  private

  def find_reward_level
    @reward_level = RewardLevel.find(params[:reward_level_id])
  end
end
