class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  def self.create
    song = Song.new
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
    @@all << song
    song
  end
  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
        song
      end
    end
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end
  def self.new_from_filename(filename)
    track = filename.split(/( - |\.)/)
    new_song = self.new
    new_song.name = track[2]
    new_song.artist_name = track [0]
    new_song
  end
  def self.create_from_filename(filename)
    new_song = self.new.new_from_filename(filename)
    self.all << new_song
    new_song.save
  end

  def self.destroy_all
    @@all = []
  end
end