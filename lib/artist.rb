class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []
  @@song_count = 0

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    found_artist = self.all.find { |artist| artist.name == name }
    if found_artist.nil?
      artist = self.new(name)
      artist.save
    else
      found_artist
    end
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

end
