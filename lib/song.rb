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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    str_arr = file_name.split(" - ")
    song = self.new
    song.artist_name = str_arr[0]
    song.name = str_arr[1].sub(".mp3", "")
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all.clear
  end

end
