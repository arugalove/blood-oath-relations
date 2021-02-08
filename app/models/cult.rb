class Cult

    attr_reader :name, :location
    @@all = []

    def initialize name, location, founding_year, slogan
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.find_by_name name
        all.find do | cult |
            cult.name == name
        end
    end

    def self.find_by_location location
        all.find do | cult |
            cult.location == location
        end
    end

    def self.find_by_founding_year founding_year
        all.find do | cult |
            cult.founding_year == founding_year
        end
    end

    def recruit_follower follower
        BloodOath.new(self, follower, Time.now)
    end

    def my_followers
        oaths = 
            (
                BloodOath.all.filter do | oath |
                    oath.cult == self
                end
            )
        oaths.map do | oath |
            oath.follower
        end
    end

    def cult_population
        self.my_followers.length
    end

end