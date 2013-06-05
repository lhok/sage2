class Info < ActiveRecord::Base
  attr_accessible :content, :title, :zd
  validates :title, :presence => true
end
