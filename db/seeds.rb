# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@board = board.new
@user = User.find(params[:id])
@board.board = @user
@board.status = 'test'
@board.limit_date = '2020-11-13'
@board.save
