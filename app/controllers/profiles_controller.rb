class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = @user.build_profile
  end

  def create
    @profile = @user.build_profile(profile_params)

    if @profile.save
      redirect_to user_profile_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def set_profile
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:bio, :github, :twitter, :linkedin, :image)
  end
end
