require "pry"
class MP3Importer
  attr_accessor :path

  def initialize(filepath)
    @path = filepath
  end

  def files
    Dir["#{path}/*.mp3"].map{|file| file.split('/').last}
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
