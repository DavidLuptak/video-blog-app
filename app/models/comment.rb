class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  acts_as_likeable
  acts_as_tree order: 'created_at DESC', dependent: :destroy
end
