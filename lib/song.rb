class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # Adds self to all
  def save
    self.class.all << self
  end

  # Create new instance of Song and add it to all
  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  # Create new instance of Song and set @name to given string name
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  # Create new instance of Song and set @name to given string name
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  # Return the instance of song with @name that matches given string name
  def self.find_by_name(name)
   self.all.find {|song| song.name == name}
  end

  # Search for instance of song with @name matching given string name
  # And return it if it exists, else create it with @name set to name
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ?
      self.find_by_name(name) :
      self.create_by_name(name)
  end

  # Sorts all in alphabetical order
  def self.alphabetical
    @@all = self.all.sort_by {|song| song.name}
  end

  # Create new instance of Song and set @name based on given filename
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # Create new instance of Song and set @name based on given filename
  # And add it to all
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # Clear all
  def self.destroy_all
    self.all.clear
  end
end
