class AddScoreToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :score, :integer, :default => 0
  end

  def self.down
    remove_column :songs, :score
  end
end