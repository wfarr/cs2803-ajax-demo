# Genres
jazz      = Genre.create!(name: 'Jazz')
rock      = Genre.create!(name: 'Rock')
classical = Genre.create!(name: 'Classical')

# Artists
miles_davis   = Artist.create!(name: 'Miles Davis',   genre: jazz)
benny_goodman = Artist.create!(name: 'Benny Goodman', genre: jazz)
glenn_miller  = Artist.create!(name: 'Glenn Miller',  genre: jazz)

the_beatles = Artist.create!(name: 'The Beatles', genre: rock)
the_doors   = Artist.create!(name: 'The Doors',   genre: rock)

tchaikovsky = Artist.create!(name: 'Piotr Ilyich Tchaikovsky', genre: classical)

# Songs

Song.create!(name: 'Freddie Freeloader', artist: miles_davis)
Song.create!(name: 'So What',            artist: miles_davis)
Song.create!(name: 'All Blues',          artist: miles_davis)
Song.create!(name: 'Begin the Beguine',  artist: benny_goodman)
Song.create!(name: 'Sing Sing Sing',     artist: benny_goodman)
Song.create!(name: 'In the Mood',        artist: glenn_miller)
Song.create!(name: 'Revolution',         artist: the_beatles)
Song.create!(name: 'Help!',              artist: the_beatles)
Song.create!(name: 'Get Back',           artist: the_beatles)