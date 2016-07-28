require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(title)
    new_song = self.new
    new_song.name = title
    new_song
  end

  def self.create_by_name(title)
    new_song = self.new
    new_song.name = title
    @@all << new_song
    new_song
  end

  def self.find_by_name(title)
    @@all.each { |song| return song if song.name == title }
  end

  def self.find_or_create_by_name(title)
    @@all.include?(name) ? find_by_name(title) : create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.artist_name = filename.split(" ").first
    new_song.name = filename.split(/\- (.*?)\./)[1]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new
    new_song.artist_name = filename.split(" ").first
    new_song.name = filename.split(/\- (.*?)\./)[1]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
