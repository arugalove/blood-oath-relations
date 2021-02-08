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
        BloodOath.new(cult, self, Time.now)
    end

    def followers_of_a_certain_age(age)
        Follower.all.filter do | follower |
            follower.age == age
        end
    end

end