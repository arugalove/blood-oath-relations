require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cromulons = Cult.new('Cromulons', 'Cygnus-5', 2015, 'Get Schwifty')
jonestown = Cult.new('Jonestown', 'Indianapolis', 1950, 'We drink the koolaid')
heavensgate = Cult.new("Heaven/'s Gate", 'San Diego', 1974, 'We love space and aliens')
solartemple = Cult.new('Order of the Solar Temple', 'Geneva', 1984, 'Doomsday is real')

hillary = Follower.new('Hillary Clinton', 73, 'Roll that shit, smoke that shit')
paul = Follower.new('Paul Stamets', 65, 'Fungi are friends')
dave = Follower.new('Dave Tipper', 44, '????')
danny = Follower.new('Danny DeVito', 76, "I'm big, you're little")
summer = Follower.new('Summer Smith', 20, 'What the fuck, grandpa?')
kim = Follower.new('Kim Possible', 17, 'Call me, beep me, if you wanna reach me')

oath1 = BloodOath.new(cromulons, summer, '2015/2/11')
oath2 = BloodOath.new(jonestown, kim, '1951/1/1')
oath3 = BloodOath.new(jonestown, paul, '1951/1/1')
oath4 = BloodOath.new(jonestown, danny, '1952/1/1')
oath8 = BloodOath.new(solartemple, hillary, '1990/4/1')
oath6 = BloodOath.new(heavensgate, dave, '1974/1/1')
oath7 = BloodOath.new(heavensgate, paul, '1988/11/1')
oath8 = BloodOath.new(solartemple, kim, '1989/12/1')
oath5 = BloodOath.new(jonestown, hillary, '1952/1/1')
oath8 = BloodOath.new(solartemple, danny, '1994/3/2')


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
