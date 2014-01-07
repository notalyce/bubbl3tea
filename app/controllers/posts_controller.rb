class PostsController < ApplicationController

  before_filter :get_post, except: [:new, :create, :index]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:title, :excerpt, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @mini_posts = Post.order('created_at DESC').page(params[:page]).per(5)
  end

  private
  
  def post_params
    params.require(:post).permit(:id, :title, :excerpt, :body)
  end
  
  def get_post
    @post = Post.friendly.find(params[:id])
  end

end
