class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.friendly.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless @user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :article, :status, :image, category_ids: [])
  end
end
