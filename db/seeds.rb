# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
User.create(id:1,name:"テスト",email:"test1@gmail.com",password:"password",password_confirmation:"password")
User.create(id:2,name:"テスト2",email:"test2@gmail.com",password:"password",password_confirmation:"password")
Attendance.create(work_in:"2022-01-01 08:59:45.000000000 +0900",break_in:"2022-01-01 12:00:05.000000000 +0900",break_out:"2022-01-01 12:59:45.000000000 +0900",work_out:"2022-01-01 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-02 08:59:45.000000000 +0900",break_in:"2022-01-02 12:00:05.000000000 +0900",break_out:"2022-01-02 12:59:45.000000000 +0900",work_out:"2022-01-02 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-03 08:59:45.000000000 +0900",break_in:"2022-01-03 12:00:05.000000000 +0900",break_out:"2022-01-03 12:59:45.000000000 +0900",work_out:"2022-01-03 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-04 08:59:45.000000000 +0900",break_in:"2022-01-04 12:00:05.000000000 +0900",break_out:"2022-01-04 12:59:45.000000000 +0900",work_out:"2022-01-04 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-05 08:59:45.000000000 +0900",break_in:"2022-01-05 12:00:05.000000000 +0900",break_out:"2022-01-05 12:59:45.000000000 +0900",work_out:"2022-01-05 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-06 08:59:45.000000000 +0900",break_in:"2022-01-06 12:00:05.000000000 +0900",break_out:"2022-01-06 12:59:45.000000000 +0900",work_out:"2022-01-06 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-07 08:59:45.000000000 +0900",break_in:"2022-01-07 12:00:05.000000000 +0900",break_out:"2022-01-07 12:59:45.000000000 +0900",work_out:"2022-01-07 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-08 08:59:45.000000000 +0900",break_in:"2022-01-08 12:00:05.000000000 +0900",break_out:"2022-01-08 12:59:45.000000000 +0900",work_out:"2022-01-08 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-09 08:59:45.000000000 +0900",break_in:"2022-01-09 12:00:05.000000000 +0900",break_out:"2022-01-09 12:59:45.000000000 +0900",work_out:"2022-01-09 20:59:45.000000000 +0900",user_id:1,break_time:3600)
Attendance.create(work_in:"2022-01-10 08:59:45.000000000 +0900",break_in:"2022-01-10 12:00:05.000000000 +0900",break_out:"2022-01-10 12:59:45.000000000 +0900",work_out:"2022-01-10 20:59:45.000000000 +0900",user_id:1,break_time:3600)

