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
 genre_id: 1,
 item_name: 'チョコレートクッキー',
 description: '大好評です',
 image: open('./app/assets/images/chocolate_cookies.jpeg'),
 non_taxed_price: 140
)

Item.create!(
  genre_id: 2,
  item_name: 'マスタードプリン',
  description: '人気です',
  image: open('./app/assets/images/puding.jpg'),
  non_taxed_price: 150
)

Item.create!(
  genre_id: 2,
  item_name: 'ココアプリン',
  description: 'リピート率No.1商品',
  image: open('./app/assets/images/cocoa_puding.jpg'),
  non_taxed_price: 160
)

Item.create!(
  genre_id: 3,
  item_name: 'ソーダ',
  description: '期間限定商品です',
  image: open('./app/assets/images/soda.jpg'),
  non_taxed_price: 170
)

Item.create!(
  genre_id: 3,
  item_name: 'オレンジジュース',
  description: '果汁100％です',
  image: open('./app/assets/images/orange_juice.jpg'),
  non_taxed_price: 180
)


EndUser.create!(
  email: 's@s',
  password: 'ssssss',
  last_name: '佐藤',
  first_name: '太郎',
  last_name_kana: 'サトウ',
  first_name_kana: 'タロウ',
  postal_code: '399-9422',
  address: '長野県北安曇郡小谷村千国乙12840-1',
  phone_number: '111-1111-1111'
)

EndUser.create!(
  email: 't@t',
  password: 'tttttt',
  last_name: '田中',
  first_name: '二郎',
  last_name_kana: 'タナカ',
  first_name_kana: 'ジロウ',
  postal_code: '381-0405',
  address: '長野県下高井郡山ノ内町夜間瀬11700',
  phone_number: '222-2222-2222'
)

EndUser.create!(
  email: 'y@y',
  password: 'yyyyyy',
  last_name: '山田',
  first_name: '三郎',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'サブロウ',
  postal_code: '389-2502',
  address: '長野県下高井郡野沢温泉村豊郷7653',
  phone_number: '333-3333-3333'
)


Address.create!(
   end_user_id: 1,
   name: '佐藤太郎(貸別荘)',
   postal_code: '384-0703',
   address: '長野県南佐久郡佐久穂町千代里2093-15'
)

Address.create!(
   end_user_id: 2,
   name: '田中二郎(貸別荘)',
   postal_code: '399-9422',
   address: '長野県北安曇郡小谷村千国乙12860-1'
)

Address.create!(
   end_user_id: 3,
   name: '山田三郎(貸別荘)',
   postal_code: '386-2204',
   address: '長野県上田市菅平高原1223-3433'
)
