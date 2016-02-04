class Category < ActiveRecord::Base
  has_many :videos

  def to_param
    name
  end
end
