class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('updated_at DESC')
    @posts = @posts.select { |p| p.title.include?(params[:title]) } unless params[:title].nil?
    @posts = @posts.select { |p| User.find(p.user_id).email.include?(params[:author]) } unless params[:author].nil?
    @posts = @posts.select { |p| p.description.include?(params[:description]) } unless params[:description].nil?
    order = if params[:order] == 'descending'
              ' DESC'
            else
              ' ASC'
            end

    if params[:sort_option].present?
      if params[:sort_option] == 'user'
        @posts = Post.all.order('user_id' + order) unless params[:sort_option].empty?
      else
        @posts = Post.all.order(params[:sort_option].to_s + order) unless params[:sort_option].empty?
      end
    end

    @listing = Post.new.attributes.keys[1..5]
    @listing[2] = @listing[2][0..3]

    @hashtags = SimpleHashtag::Hashtag.select { |hashtag| !hashtag.hashtaggables.empty? }
  end

  def user_index
    @posts = current_user.posts
    @listing = Post.new.attributes.keys[1..5]
    @listing[2] = @listing[2][0..3]
    @hashtags = SimpleHashtag::Hashtag.select { |hashtag| !hashtag.hashtaggables.empty? }

    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.hash_tree
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
