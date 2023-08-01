class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def new
    if logged_in?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(parent_id: params[:parent_id])
      @comment.commenter = session[:username]
    else
      redirect_to "/login"
    end
  end


  def create
    if logged_in?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)

      @comment.commenter = session[:username]
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        else
          @error_messages = @comment.errors.full_messages
          format.html { redirect_to "/new", notice: "Comment body could not be empty."}
        end
      end
    else
      redirect_to "/login"
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if(@comment.commenter == session[:username])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @comment.post, notice: 'Comment was successfully destroyed.'}
      end
    end

  end


  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :parent_id)
    end
end
