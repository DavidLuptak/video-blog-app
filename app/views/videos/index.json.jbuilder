json.array!(@videos) do |video|
  json.extract! video, :id, :link, :title, :uid, :published_at, :thumbnail_url, :category_title, :category_title, :like_count, :dislike_count, :duration
  json.url video_url(video, format: :json)
end
