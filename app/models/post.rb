class Post < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :description

  belongs_to :user
  has_one :video
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :video

  validates_presence_of :title
end
