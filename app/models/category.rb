# encoding: utf-8

class Category < ActiveRecord::Base
  has_many :images, :dependent => :delete_all
  
  validates_presence_of :name, :body

  scope :main_categories, -> { where("name = ? OR name = ? OR name = ?", "ślub", "wesele", "chrzest") }
  
  class <<self
    def all_as_pairs
      all.map{|cat| [cat.name, cat.id]}
    end
    
    def predefined_names
      %w(ślub wesele chrzest plener dzieci inne)
    end
    
    # def main_categories
    #   find(:all, :conditions => {:name => %w(ślub wesele chrzest)})
    # end
  end
  
  def predefined?
    self.class.predefined_names.include?(name)
  end
  
end
