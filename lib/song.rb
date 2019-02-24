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
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    if  self.all.include?(name) #if class array has song
      self.all.select do |songs|
        songs.name == name
      end
    else
      song = self.new_by_name(name)
    end
  end

  def self.find_by_name(name)
    # if self.all.include?(name)
      self.all.find do |songs|
        songs.name == name
      end
    # else
    #   nil
    # end
    #binding.pry
  end

  def self.alphabetical
    self.all.sort_by do |songs|
      songs.name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    second_array = array[1].split(".mp3")
    title = second_array[0]
    #binding.pry
    new = self.new
    new.name = title
    new.artist_name = artist
    new
  end

  def self.create_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    second_array = array[1].split(".mp3")
    title = second_array[0]
    #binding.pry
    new = self.new
    new.name = title
    new.artist_name = artist
    new.save 
  end

  def self.destroy_all
    @@all.clear
  end

end
