class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.order('created_at DESC')
    @categories = Category.all
  end

  def filter
    @videos = Category.find_by_name(params[:name]).videos
    @categories = Category.all
    render :index
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:default] = 'Video was successfully created.'
      redirect_to @video
    else
      render :new
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if @video.update(video_params)
      flash[:default] = 'Video was successfully updated.'
      redirect_to @video
    else
      render :edit
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    flash[:default] = 'Video was successfully destroyed.'
    redirect_to videos_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:link)
  end
end
