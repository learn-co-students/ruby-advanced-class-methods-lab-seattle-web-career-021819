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
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(filename)
    new_array = filename.split(" - ")
    artist_name = new_array[0]
    song_name = new_array[1].chomp(".mp3")
    song = Song.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    new_array = filename.split(" - ")
    artist_name = new_array[0]
    song_name = new_array[1].chomp(".mp3")
    song = Song.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
