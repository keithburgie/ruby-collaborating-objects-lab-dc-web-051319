
class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            # I cheated here. I don't understand .tap
            self.new(name).tap{|artist| artist.save}
        end
    end

    def add_song(song)
        songs << song
    end

    def print_songs
        songs.each{|song| puts song.name}
    end

end