class AddCategoryIdToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :category_id, :integer
  end

  def self.down
    remove_column :images, :category_id
  end
end
