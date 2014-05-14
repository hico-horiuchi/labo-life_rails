# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User
User.destroy_all
User.create(name: '教員', student_no: 'teacher', email: 'teacher@labolife.jp', password: 'password', password_confirmation: 'password', grade: 10)
User.create(name: '修士', student_no: 'master', email: 'master@labolife.jp', password: 'password', password_confirmation: 'password', grade: 4)
User.create(name: '学士', student_no: 'bachelor', email: 'bachelor@labolife.jp', password: 'password', password_confirmation: 'password', grade: 3)
