class Genre < ActiveRecord::Base
  has_many :artists
end

class Artist < ActiveRecord::Base
  has_many :songs
  belongs_to :genre
end

class Song < ActiveRecord::Base
  belongs_to :artist
end