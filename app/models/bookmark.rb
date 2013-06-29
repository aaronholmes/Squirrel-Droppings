class Bookmark < ActiveRecord::Base
  validates_presence_of :title, :summary, :url
  validates_uniqueness_of :url
end
