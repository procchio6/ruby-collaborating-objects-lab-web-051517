require "pry"
class Song
  attr_accessor :name, :artist

  def initialize(song_name)
    @name = song_name
  end

  def self.new_by_filename(filename)
    artist, name = parse_filename(filename)
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.add_song(song)
    song
  end

  private

  def self.parse_filename(filename)
    filename.split(/[\.]|(\s-\s)/).delete_if { |e| e == ' - ' || e == 'mp3' }
  end
end
