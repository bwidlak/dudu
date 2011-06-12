class ChangeSequenceOfCategories < ActiveRecord::Migration
  class Category < ActiveRecord::Base
  end
    
  def self.up
    Category.delete_all
    Category.create!(:name => 'ślub', :body => 'ślub')
    Category.create!(:name => 'wesele', :body => 'wesele')
    Category.create!(:name => 'plener', :body => 'plener')
    Category.create!(:name => 'chrzest', :body => 'chrzest')
    Category.create!(:name => 'dzieci', :body => 'dzieci')
    Category.create!(:name => 'inne', :body => 'inne')
  end

  def self.down
    Category.delete_all
  end
end