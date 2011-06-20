class AddAssociations < ActiveRecord::Migration
  def self.up
    add_column :artists, :genre_id, :integer
    add_column :songs, :artist_id, :integer
  end

  def self.down
    remove_column :artists, :genre_id
    remove_column :songs, :artist_id
  end
end