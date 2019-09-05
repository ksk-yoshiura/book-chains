# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



[
  ['こころ', '夏目漱石', '3', 'こころ', 'https://images-na.ssl-images-amazon.com/images/I/51kySjMWhTL._SX350_BO1,204,203,200_.jpg'],
  ['吾輩は猫である', '夏目漱石', '3', 'わがはいはねこである','https://images-na.ssl-images-amazon.com/images/I/51jsTL5zjNL._SX349_BO1,204,203,200_.jpg'],
  ['舞姫', '森鴎外', '3', 'まいひめ','https://images-na.ssl-images-amazon.com/images/I/513M3302GEL._SX349_BO1,204,203,200_.jpg'],
  ['ヰタ・セクスアリス', '森鴎外', '3', 'いたせくすありす','https://images-na.ssl-images-amazon.com/images/I/51WXIg1UrnL._SX298_BO1,204,203,200_.jpg'],
  ['春琴抄', '谷崎純一郎', '3', 'しゅんきんしょう','https://images-na.ssl-images-amazon.com/images/I/51IqDhfKs6L._SX346_BO1,204,203,200_.jpg'],
  ['砂の女', '安部公房', '3', 'すなのあんな','https://images-na.ssl-images-amazon.com/images/I/51ZEUofG-rL._SX351_BO1,204,203,200_.jpg'],
  ['すべてがFになる', '森博嗣', '4', 'すべてがえふになる','https://images-na.ssl-images-amazon.com/images/I/41vAbauP0TL._SX353_BO1,204,203,200_.jpg'],
  ['今はもうない', '森博嗣', '4', 'いまはもうない','https://images-na.ssl-images-amazon.com/images/I/41Dl1orR29L._SX349_BO1,204,203,200_.jpg'],
  ['有限と微小のパン', '森博嗣', '4', 'ゆうげんとびしょうのぱん','https://images-na.ssl-images-amazon.com/images/I/41uPPSakctL._SX348_BO1,204,203,200_.jpg'],
  ['四季 春', '森博嗣', '4', 'しきはる','https://images-na.ssl-images-amazon.com/images/I/517yTNTjikL._SX358_BO1,204,203,200_.jpg'],
  ['スカイ・クロラ', '森博嗣', '4', 'すかいくろら','https://images-na.ssl-images-amazon.com/images/I/41Iqv02fNaL._SX353_BO1,204,203,200_.jpg'],
  ['十角館の殺人', '綾辻行人', '4', 'じゅっかくかんのさつじん','https://images-na.ssl-images-amazon.com/images/I/51hty9rMq2L._SX356_BO1,204,203,200_.jpg'],
  ['葉桜の季節に君を想うということ', '歌野晶午', '4', 'はざくらのきせつにきみをおもうということ','https://images-na.ssl-images-amazon.com/images/I/41sFDgS0kDL._SX355_BO1,204,203,200_.jpg'],
  ['ハサミ男', '殊能将之', '4', 'はさみおとこ','https://images-na.ssl-images-amazon.com/images/I/51P9BTYWETL._SX336_BO1,204,203,200_.jpg'],
  ['バカの壁', '養老孟司', '5', 'ばかのかべ','https://images-na.ssl-images-amazon.com/images/I/41E2G19SYZL._SX289_BO1,204,203,200_.jpg'],
  ['下流志向', '内田樹', '5', 'かりゅうしこう','https://images-na.ssl-images-amazon.com/images/I/41-YVhKbAjL._SX357_BO1,204,203,200_.jpg'],
  ['嘘つきアーニャの真っ赤な真実', '米原万里', '5', 'うそつきあーにゃのまっかなしんじつ','https://images-na.ssl-images-amazon.com/images/I/5176hrkdP1L._SX352_BO1,204,203,200_.jpg'],
  ['オリガ・モリソヴナの反語法', '米原万里', '5', 'おりがもりそゔなのはんごほう','https://images-na.ssl-images-amazon.com/images/I/318DYPJJ7VL._BO1,204,203,200_.jpg'],
  ['日本辺境論', '内田樹', '5', 'にほんへんきょうろん','https://images-fe.ssl-images-amazon.com/images/I/41TMl8XrczL.jpg'],
  ['寝ながら学べる構造主義', '内田樹', '5', 'ねながらまなべるこうぞうしゅぎ','https://images-fe.ssl-images-amazon.com/images/I/41WurQxfutL.jpg'],
  ['英語翻訳術', '安西徹雄', '5', 'えいごほんやくじゅつ','https://images-na.ssl-images-amazon.com/images/I/513YBG6T33L._SX339_BO1,204,203,200_.jpg'],
  ['英語の発想', '安西徹雄', '5', 'えいごのはっそう','https://images-na.ssl-images-amazon.com/images/I/51E0Z3ZZENL._SX338_BO1,204,203,200_.jpg'],
  ['雪を待つ', 'ラシャ・ムジャ', '5', 'ゆきをまつ','https://images-na.ssl-images-amazon.com/images/I/51IXGfT8LQL._SX340_BO1,204,203,200_.jpg']
].each do |title, author, user_id, furigana, image|
  Book.create!(
    { title: title, author: author, user_id: user_id, furigana: furigana, image: image }
  )
end