class CommentsController < ApplicationController
  # load_and_authorize_resource

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    @comment.save
    flash[:default] = 'Comment was successfully created.'
    redirect_to @post
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
