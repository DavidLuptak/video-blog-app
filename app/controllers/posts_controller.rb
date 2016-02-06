class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @posts = Post.all.select{ |p| p.title.include?(params[:title])} unless params[:title].nil?
    @posts = Post.all.select{ |p| User.find(p.user_id).email.include?(params[:author])} unless params[:author].nil?
    @posts = Post.all.select{ |p| p.description.include?(params[:description])} unless params[:description].nil?
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @video = @post.build_video
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:default] = 'Post was successfully created.'
      redirect_to @post
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      flash[:default] = 'Post was successfully updated.'
      redirect_to @post
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:default] = 'Post was successfully destroyed.'
    redirect_to posts_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description, video_attributes: [:link])
  end
end
