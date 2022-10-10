class PostsController < ApplicationController
  before_action :find_post, only: %i[show update edit destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully created'
      redirect_to @post
    else
      render action: 'new'
    end
  end

  def show; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render action: 'edit'
    end
  end

  def edit; end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
