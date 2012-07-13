class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments, :dependent => :destroy
  belongs_to :user
  validates :title, :content, :presence => true
  validates :content, :length => {:minimum => 3}
end
