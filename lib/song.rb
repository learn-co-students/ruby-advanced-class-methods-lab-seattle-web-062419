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
    new_song=Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song=Song.new
    new_song.name=name
    new_song
  end

  def self.create_by_name(name)
    song=Song.new
    song.name=name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name==name
    end
  end

  def self.find_or_create_by_name(name)
     if self.find_by_name(name)
        self.find_by_name(name)

     else
        self.create_by_name(name)
     end
  end

  def self.alphabetical
     @@all.sort_by do |song|
      song.name
    end
  
  end

  def self.new_from_filename(filename)
     artist=filename.split("-")[0].strip
     name=filename.split(/[-.]/)[1].strip
     song= Song.new
     song.artist_name=artist
     song.name=name
     song
  end

  def self.create_from_filename(filename)
    artist=filename.split("-")[0].strip
    name=filename.split(/[-.]/)[1].strip
    song=self.create
    song.name=name
    song.artist_name=artist
    song
  end

  def self.destroy_all
    @@all.clear
  end








end
