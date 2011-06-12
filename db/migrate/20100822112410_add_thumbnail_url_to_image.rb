class AddThumbnailUrlToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :thumbnail_url, :string
  end

  def self.down
    remove_column :images, :thumbnail_url
  end
end
