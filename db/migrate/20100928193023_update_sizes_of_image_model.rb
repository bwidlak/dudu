class UpdateSizesOfImageModel < ActiveRecord::Migration
  def self.up
    remove_column :images, :title
    add_column :images, :small_url, :string
    add_column :images, :medium_url, :string
  end

  def self.down
    remove_column :images, :medium_url
    remove_column :images, :small_url
    add_column :images, :title, :string
  end
end
