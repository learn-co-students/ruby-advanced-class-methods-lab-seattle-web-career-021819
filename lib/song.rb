require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by do |title|
      title.name
    end
  end

  def self.new_from_filename(song_file)
    split_text = song_file.split(" - ")
    artist_name = split_text[0]
    name = split_text[1].sub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_file)
    split_text = song_file.split(" - ")
    artist_name = split_text[0]
    name = split_text[1].sub(".mp3", "")

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
