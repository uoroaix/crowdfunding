class WelcomeController < ApplicationController
  def index
    @campaigns = Campaign.published.paginate(page: params[:page], per_page: 12)
  end
end
