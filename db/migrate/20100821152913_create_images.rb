class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title
      t.text :body
      t.integer :status
      t.integer :img_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
