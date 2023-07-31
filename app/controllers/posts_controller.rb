class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @error_messages = notice.presence
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = session[:user_id]
      @error_messages = []

      if @post.save
            redirect_to @post
      else
        if !logged_in?
          @error_messages << "You must be logged in"
          redirect_to "/login"
        else
          @error_messages = @post.errors.full_messages
          redirect_to "/posts/new", notice: @error_messages
        end
      end

  end

  def edit
    @post = Post.find(params[:id])
    @error_messages = notice.presence
    if @post.user_id == session[:user_id]
      render :edit
    else
      @error_messages << "You must be logged in"
      redirect_to "/login"
    end
  end

  def update
    @post = Post.find(params[:id])
    @error_messages = []
    if @post.update(post_params)
      redirect_to @post
    else
      @error_messages = @post.errors.full_messages
      redirect_to "/posts/edit", notice: @error_messages
    end
  end

  def destroy

    @post = Post.find(params[:id])
    if @post.user_id == session[:user_id]
      @post.destroy
      redirect_to posts_path, status: :see_other
    else
      redirect_to "/login"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :img , :body, :user_id)
  end
end
