class Video < ActiveRecord::Base
  belongs_to :post

  YT_LINK_FORMAT = %r{\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}i

  validates :link, presence: true, format: YT_LINK_FORMAT
end
