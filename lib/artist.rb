class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = @@all.find {|artst| artst.name == artist_name}
    if found_artist == nil
      new_artist = self.new(artist_name)
      new_artist.save
      new_artist
    else
      found_artist
    end
  end
end
