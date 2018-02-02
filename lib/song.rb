class Song
  attr_reader :name

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    # filename.slice!('.mp3')
    cut_name = filename.split(' - ', 3)[1]

    new_song = self.new(cut_name)
    new_song.artist = Artist.find_or_create_by_name(filename.split(' - ', 3)[0])
    new_song.artist.add_song(new_song)
    new_song
  end
end
