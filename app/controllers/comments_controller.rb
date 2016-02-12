class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy, :like, :unlike]
  # load_and_authorize_resource

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
    @post = Post.find(params[:post_id])
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])

    if params[:comment][:parent_id].to_i > 0
      parent = @post.comments.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.post_id = @post.id
    else
      @comment = @post.comments.new(comment_params)
    end

    @comment.user_id = current_user.id

    @comment.save
    flash[:default] = 'Comment was successfully created.'
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment.destroy
    flash[:default] = 'Comment was successfully destroyed.'
    redirect_to @post
  end

  def like
    current_user.like!(@comment)
    redirect_to @comment.post
  end

  def unlike
    current_user.unlike!(@comment)
    redirect_to @comment.post
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
