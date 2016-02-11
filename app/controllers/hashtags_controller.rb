class HashtagsController < ApplicationController
  def index
    @hashtags = SimpleHashtag::Hashtag.select { |hashtag| !hashtag.hashtaggables.empty? }
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(hash_params)
    @posts = @hashtag.hashtaggables.sort_by(&:updated_at).reverse

    @listing = Post.new.attributes.keys[1..5]
    @listing[2] = @listing[2][0..3]

    render 'posts/index'
  end

  private

  def hash_params
    params.require(:hashtag)
  end
end
