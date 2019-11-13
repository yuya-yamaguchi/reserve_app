# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'date'
# today = Date.today
# hour = 10
# date_cnt = 0
# if Rails.env == "development"
#   # スタジオ単位
#   4.times do |i|
#     # 日単位
#     while date_cnt < 365 do
#       # 時間単位
#       while hour < 22 do
#         Reserve.create!(studio_id: i + 1, date: today + date_cnt, hour: hour, reserve_flg: 0, created_at: "2019-11-11", updated_at: "2019-11-11")
#         hour += 1
#       end
#       hour = 10
#       date_cnt += 1
#     end
#     date_cnt = 0
#   end
#end
AdminUser.create!(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password') if Rails.env.development?