# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hour = 10

if Rails.env == "development"
  42.times do |i|
    Reserve.create!(studio_id: 1, date: "2019-11-07", hour: hour, reserve_flg: 0, created_at: "2019-11-07", updated_at: "2019-11-07")
    hour += 1
    if hour == 16
      hour = 10
    end
  end
end