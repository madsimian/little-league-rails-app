# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

TEAMS = ["Wild Weasels", "Boffo Buffalo", "Terminal Turtles", "Gruesome Geese", "Swift Swizzlesticks", "Fierce Foxes"]
LNAMES = ['Smith','Jones','Arnaldsdottir','Baldwin','Barnes','Cook','Fox','Grebe','Haberstroh','Hillgartner','Lin','McCarthy','Powers','Rodriguez','Sovell','Taylor','Thomas','Thurlow','Watson','Wei','Zhu']
FNAMES = ['John','Jane','April','Yifan','Kelly','Edda','Nichole','Becky','Katie','Matt','Lindsey','Rebecca','Kelsey','Robert','Emily','Jennifer','Erin','Xiaoying','Sam','Erin']
NICKNAME_SUFFIXES = ["y","ie","ums"]
FAMILIES = LNAMES.sample(4)
EMAIL_PROVIDER = ["yahoo.com","gmail.com","hotmail.com","mac.com"]
STREET_NAMES = ["Elm", "Maple", "Evergreen", "Mendota", "Monona", "Tamiami", "Crow", "Robin", "Sparrow"]
STREET_TYPES = ["St.", "Ave", "Blvd.", "Road", "Highway"]
CITIES = ["Madison","Sun Prarie","Verona","Middleton"]
COACH_AGE_RANGE = 25..60
PLAYER_AGE_RANGE = 12..16
TEAM_SIZE_RANGE = 20..25
GAMES = 20
SCORE_RANGE = 0..25

def percent_chance(percent)
  (rand(100) <= percent) ? true : false
end

def generate_family(family_surname=LNAMES.sample)
  Family.create(:surname => family_surname,
                :phone_home => generate_phone_number,
                :phone_cell => generate_phone_number,
                :email => generate_email(family_surname),
                :mailing_address => generate_mailing_address)
end

def generate_email(lname)
  "#{lname}@#{EMAIL_PROVIDER.sample}"
end

def generate_phone_number(area_code=608)
  "(#{area_code}) #{rand(100..999)}-#{rand(1000..9999)}"
end

def generate_mailing_address
  <<-END
#{rand(999)} #{STREET_NAMES.sample} #{STREET_TYPES.sample}
#{CITIES.sample}, WI 5370#{rand(9)}
END
end

def generate_location
  "#{LNAMES.sample} #{["Field","Park", "Rec Center"].sample}"
end

# Create teams and coaches and players
TEAMS.each do |team_name|
  coach_family = generate_family if percent_chance(50)
  coach = Coach.create(:fname => FNAMES.sample,
                       :lname => (coach_family.try(:surname) or LNAMES.sample),
                       :birthday => rand(COACH_AGE_RANGE).years.ago.advance(:days => rand(365)),
                       :family => coach_family)

  team = Team.create(:name => team_name,
                     :coach => coach)

  rand(TEAM_SIZE_RANGE).times do
    fname = FNAMES.sample
    nickname = "#{fname}#{NICKNAME_SUFFIXES.sample}"
    if percent_chance(5)
      family = Family.where('id >= ?', rand(Family.count)).first
    else
      family = generate_family
    end
    Player.create(:fname => fname,
                  :lname => family.surname,
                  :birthday => rand(PLAYER_AGE_RANGE).years.ago.advance(:days => rand(365)),
                  :nickname => nickname,
                  :team => team,
                  :family => family)
  end
end

GAMES.times do
  game = Game.create(:location => generate_location,
                     :date => 2.years.ago.advance(:days => (rand(730) - 1)))

  teams = Team.all

  teams.sample(2).each do |team|
    Matchup.create(:game => game,
                   :team => team,
                   :score => rand(SCORE_RANGE))
  end

  # winning team
  game.team = game.matchups.order(:score).first
  game.save
  
end
