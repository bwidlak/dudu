class Comment < ActiveRecord::Base
  validates_presence_of :body, :author
  named_scope :random, :order => 'random()', :limit => 1
end
