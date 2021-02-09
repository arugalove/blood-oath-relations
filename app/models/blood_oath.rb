class BloodOath

    attr_reader :cult, :follower, :initiation_date
    @@all = []

    def initialize cult, follower, initiation_date
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.first_oath
        ((BloodOath.all.map do | blood_oath |
            {blood_oath => 
            (blood_oath.initiation_date.split("/").map do | date_part |
                date_part.ljust(2, '0')
            end).join.to_i}
        end).sort_by do | blood_oath_date_hash |
            blood_oath_date_hash.values[0]
        end)[0].keys[0].initiation_date
    end

end
