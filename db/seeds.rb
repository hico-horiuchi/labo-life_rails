# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User
User.destroy_all
User.create(name: '教員', student_no: 'teacher', email: 'teacher@sss.jp', password: 'password', password_confirmation: 'password', level: 2)
User.create(name: '助手', student_no: 'assistant', email: 'assistant@sss.jp', password: 'password', password_confirmation: 'password', level: 1)
User.create(name: '学生', student_no: 'student', email: 'student@sss.jp', password: 'password', password_confirmation: 'password', level: 0)
