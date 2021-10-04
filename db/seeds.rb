# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'abc@abc',
  password: 'abcdefg'
)


Genre.create!(
  name: 'クッキー'
)

Genre.create!(
  name: 'プリン'
)

Genre.create!(
  name: 'ドリンク'
)


Item.create!(
  genre_id: 1,
  item_name: 'バタークッキー',
  description: 'おすすめです',
  image: open('./app/assets/images/cookie.jpg'),
  non_taxed_price: 130
)

Item.create!(
  genre_id: 2,
  item_name: 'マスタードプリン',
  description: '人気です',
  image: open('./app/assets/images/puding.jpg'),
  non_taxed_price: 140
)

Item.create!(
  genre_id: 3,
  item_name: 'ソーダ',
  description: '期間限定商品です',
  image: open('./app/assets/images/soda.jpg'),
  non_taxed_price: 150
)