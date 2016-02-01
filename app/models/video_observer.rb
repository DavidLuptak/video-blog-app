class VideoObserver < ActiveRecord::Observer
  UNKNOWN = 'unknown'.freeze

  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.title = video.title
    resource.uid = video.id
    resource.published_at = video.published_at
    resource.thumbnail_url = video.thumbnail_url
    resource.category_title = video.category_title
    resource.view_count = video.view_count
    resource.like_count = video.like_count
    resource.dislike_count = video.dislike_count
    resource.duration = video.duration
  rescue # Yt::Errors::NoItems
    resource.title = UNKNOWN
    resource.uid = UNKNOWN
    resource.published_at = Time.now
    resource.thumbnail_url = UNKNOWN
    resource.category_title = UNKNOWN
    resource.view_count = UNKNOWN
    resource.like_count = UNKNOWN
    resource.dislike_count = UNKNOWN
    resource.duration = UNKNOWN
  end
end
