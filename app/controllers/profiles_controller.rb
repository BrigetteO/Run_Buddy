class ProfilesController < ApplicationController
  def show
    @tides = Tide.all
    @user = User.find(params[:id])
  end
end
