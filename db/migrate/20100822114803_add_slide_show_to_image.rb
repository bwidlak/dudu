class AddSlideShowToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :slideshow, :integer, :default => 2, :null => false
  end

  def self.down
    remove_column :images, :slideshow
  end
end
