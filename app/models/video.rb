class Video < ActiveRecord::Base
  belongs_to :post
  belongs_to :category

  YT_LINK_FORMAT = %r{\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}i

  validates :link, presence: true, format: YT_LINK_FORMAT

  after_save :checkCategory

  def checkCategory
     category = Category.find_or_create_by!(name: category_title)
  end

end
