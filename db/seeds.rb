# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
    (1..50).each do |i|
        Board.create(person_name: "投稿者#{i}", company_name: "発注企業名#{i}", work_place: "勤務地#{i}", body: "本文#{i}")
    end

    Tag.create([
        { namen: '飲食' },
        { namen: '軽作業' },
        { namen: '製造・物流' },
        { namen: '営業・販売' },
        { namen: '事務・オフィスワーク' },
        { namen: 'その他' }
    ])
end
