def get_first_name_of_season_winner(data, season)
  data[season].find do |contestant|
    contestant.fetch("status") == "Winner"
  end.fetch("name").split.first
end

def get_contestant_name(data, occupation)
  all_contestants(data).find do |contestant|
    contestant.fetch("occupation") == occupation
  end.fetch("name")
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  all_contestants(data).each do |contestant|
    counter += 1 if contestant.fetch("hometown") == hometown
  end
  counter
end

def get_occupation(data, hometown)
  all_contestants(data).find do |contestant|
    contestant.fetch("hometown") == hometown
  end.fetch("occupation")
end

def get_average_age_for_season(data, season)
  ages = []
  data[season].each do |contestant|
    ages << contestant.fetch("age").to_f
  end
  (ages.reduce(:+) / ages.length).round
end



def all_contestants(data)
  all = []
  data.each do |season, season_contestants|
    all = all + season_contestants
  end
  all
end
