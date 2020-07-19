require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(value)
    new_song = self.create
    new_song.name = value
    new_song
  end

  def self.create_by_name(string_name)
    self.new_by_name(string_name)
  end

  def self.find_by_name(song)
    self.all.detect do |songs|
      songs.name == song
    end
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) 
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.sort_by {|track| track.name}
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
