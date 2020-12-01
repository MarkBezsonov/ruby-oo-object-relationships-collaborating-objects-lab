class Song

    attr_accessor :name, :artist
    @@all = []
  
    def initialize(name)
        @name = name
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
  
    def self.new_by_filename(file) #Doesn't work
        song_info = file.chomp(".mp3").split(" - ")
        song = Song.new(song_info[1])
        song.artist_name = song_info[0]
        song
    end
  
    def artist_name=(name) #Doesn't work (linked to add_song in Artist)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
  
end