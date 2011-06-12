class AddInneToCategory < ActiveRecord::Migration
  def self.up
    execute "update Categories set name = 'komunia' where name = 'inne'"
    execute "update Categories set body = 'komunia' where name = 'inne'"
    Category.create!(:name => 'inne', :body => 'inne')
  end

  def self.down
  end
end
