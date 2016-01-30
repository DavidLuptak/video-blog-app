class HashtagsController < ApplicationController
  def index
    @hashtags = SimpleHashtag::Hashtag.all
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(hash_params)
    # @hashtagged = @hashtag.hashtaggables if @hashtag
    @posts = @hashtag.hashtaggables

    render 'posts/index'
  end

  private

  def hash_params
    params.require(:hashtag)
  end
end
