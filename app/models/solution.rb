class Solution < ActiveRecord::Base
  attr_accessible :catalog, :content, :name
  validates :catalog, :presence => true
  validates :name, :presence => true
end
