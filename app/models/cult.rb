class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize name, location, founding_year, slogan, minimum_age
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @minimum_age = minimum_age

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
        if follower.age < self.minimum_age
            puts "Sorry, but you are too young to join."
        else
            BloodOath.new(self, follower, Time.now)
        end
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

    def average_age
        (
            self.my_followers.reduce(0.0) do | sum, follower |
                sum + follower.age
            end
        ) / self.cult_population
    end

    def my_followers_mottos
        self.my_followers.each do | follower |
            puts follower.life_motto
        end
    end

    def self.least_popular
        Cult.all.min_by do | cult |    
            cult.cult_population
        end
    end

    def self.locations
        Cult.all.reduce([]) do | locations, cult |
            locations.push(cult.location)
        end
    end

    def self.most_common_location
        Cult.locations.max_by do | location |
            Cult.locations.count(location)
        end
    end

    def minimum_age


    end