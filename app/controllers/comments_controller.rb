class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]


  def index
    @comments = Comment.all
  end


  def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(parent_id: params[:parent_id])
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :parent_id)
    end
end
