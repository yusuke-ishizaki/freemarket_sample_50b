# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require 'csv'

# CSV.foreach('ファイルパス') do |hoge|   # hogeは配列クラス
#   モデル名.create!(DBのカラム名1:    hoge['対応するCSVのカラム名'],
#                  DBのカラム名2:     hoge['対応するCSVのカラム名'],
#                  ....
#                  )
# end

require 'csv'

CSV.foreach('db/category.csv', headers: true) do |row|
  Category.find_or_create_by(
    id: row['id'],
    name: row['name'],
    parent_id: row['parent_id'],
  )
end
