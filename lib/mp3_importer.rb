require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files = Dir.glob "#{@path}/*.mp3"
    @files.map do |file|
      file.gsub("#{@path}/", "")
    end
  end

  def import
    files.each do |file|
      Song.new_by_filename(file)
      # binding.pry
      # new_art = Artist.find_or_create_by_name(song.artist)
      # if new_art.save
    end
    # binding.pry

  end
end
