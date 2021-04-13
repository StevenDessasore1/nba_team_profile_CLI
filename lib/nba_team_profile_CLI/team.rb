class Team 
    attr_accessor :abbreviation, :conference, :division, :full_name, :city

    @@all = []

    def initialize(team_hash)
        team_hash. each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_by_selection(team_full_name)
        self.all.detect do |team|
            team.full_name == team_full_name
        end
    end
end