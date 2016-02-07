class Video < ActiveRecord::Base
  belongs_to :post
  has_and_belongs_to_many :category

  YT_LINK_FORMAT = %r{\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}i

  validates :link, presence: true, format: YT_LINK_FORMAT

  after_save :check_category

  def check_category
    category << Category.find_or_create_by!(name: category_title)
  end
end
