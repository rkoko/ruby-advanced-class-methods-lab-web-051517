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
    song=self.new
    song.save #@@all<<song
    song
  end

  def self.new_by_name(string)
  song = self.new
  song.name = string
  song
  end

  def self.create_by_name(string)
    song=self.new
    song.name=string
    song.save #@@all<<song
    song
  end

  def self.find_by_name(string)
    @@all.detect{|song| song.name==string }
  end

  def self.find_or_create_by_name(string)
    if self.find_by_name(string) == nil
      self.create_by_name(string)
    else
      self.find_by_name(string)
    end
end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    artist = parsed[0]
    song = parsed[1][0..-5]
    new_song=self.new
    new_song.name=song
    new_song.artist_name=artist
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
