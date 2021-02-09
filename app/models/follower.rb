class Follower

    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def cults
        oaths = 
            (
                BloodOath.all.filter do | oath |
                    oath.follower == self
                end
            )
        oaths.map do | oath |
            oath.cult 
        end
    end

    def join_cult(cult)
        if self.age < cult.minimum_age
            puts "Sorry, but you are too young to join."
        else
            BloodOath.new(cult, self, Time.now)
        end
    end

    def self.of_a_certain_age(age)
        Follower.all.filter do | follower |
            follower.age == age
        end
    end

    def my_cults_slogans
        self.cults.each do | cult |
            puts cult.slogan
        end
    end

    def self.most_active
        Follower.all.max_by do | follower |
            follower.cults.length
        end
    end

    def self.top_ten
        (
            Follower.all.sort_by do | follower |
                follower.cults.length
            end
        ).reverse.first(10)
    end

    def fellow_cult_members 
        Follower.all.filter do | follower |
            (follower.cults - self.cults).empty? && follower != self
        end
    end



end