require 'csv'
require 'faker'

Game.delete_all
Genre.delete_all
Team.delete_all
Review.delete_all

# # Number of fake games to generate
# NUM_FAKE_GAMES = 20

# # Create fake games
# NUM_FAKE_GAMES.times do
#   title = Faker::Game.title
#   release_date = Faker::Date.between(from: 5.years.ago, to: Date.today)
#   rating = Faker::Number.decimal(l_digits: 1, r_digits: 1)
#   summary = Faker::Lorem.paragraph

#   game = Game.create(
#     title: title,
#     release_date: release_date,
#     rating: rating,
#     summary: summary
#   )

#   # Create fake reviews for each game
#   rand(1..5).times do
#     review_content = Faker::Lorem.paragraph
#     game.reviews.create(content: review_content)
#   end

#   # Create fake teams for each game
#   rand(1..3).times do
#     team_name = Faker::Team.name
#     team = Team.find_or_create_by(name: team_name)
#     game.teams << team
#   end

#   # Create fake genres for each game
#   rand(1..3).times do
#     genre_name = Faker::Game.genre
#     genre = Genre.find_or_create_by(name: genre_name)
#     game.genres << genre
#   end
# end

# puts "Created #{Game.count} Games using Faker"
# puts "Created #{Review.count} Reviews using Faker"
# puts "Created #{Team.count} Teams using Faker"
# puts "Created #{Genre.count} Genres using Faker"

#fetch the filename
filename = Rails.root.join("db/games.csv")

puts "loading data from the CSV file #{filename}"

csv_data = File.read(filename)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |r|
  game = Game.create(
    title:          r["Title"],
    release_date:   r["Release Date"],
    rating:         r["Rating"],
    summary:        r["Summary"],
    )
    puts "Invalid game #{r["Title"]}: #{game.errors.full_messages.join(', ')}" unless game&.valid?

    reviews = r["Reviews"].split("', '").map { |review| review.gsub("'", '') }

    reviews.each do |review_content|
      review = game.reviews.create(content: review_content)
      unless review&.valid?
        puts "Invalid review '#{review_content}' for game #{r['Title']}: #{review.errors.full_messages.join(', ')}"
      end
    end

    teams = r["Team"].split(",").map(&:strip)

    teams.each do |team_name|
      team = Team.find_or_create_by(name: team_name)
      game.teams << team
    end

    genres = r["Genres"].split(",").map { |genre| genre.strip }

    genres.each do |g|
      genre = Genre.find_or_create_by(name: g)
      game.genres << genre
    end

end

puts "Created #{Game.count} Games"
puts "Created #{Review.count} Reviews"
puts "Created #{Team.count} Teams"
puts "Created #{Genre.count} Genres"
