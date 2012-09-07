#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
aa = <<EOS

　　　　[[message]]

　　　　　　V
 　　 ∩＿＿＿∩
 　　 | ノ　　　　　 ヽ
 　　/　　●　　　● |
 　 |　　　　( _●_)　 ミ
 　彡､　　　|∪|　　､｀＼
 /　＿＿　 ヽノ　/´>　 )
 (＿＿＿）　　　/　(_／
 　|　　　　　　 /
 　|　　／＼　＼
 　|　/　　　 )　 )
 　∪　　　 （　 ＼
 　　　　　　 ＼＿)

EOS
template = Template.create!({
  id: 1,
  aa: aa
})

message = Message.create!({
  template_id: 1,
  content:  "Hello World!"
})
