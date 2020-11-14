# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

#load_tasksを消したいが、消えない
Rails.application.load_tasks
#本当はloard_boardsを追加したいが、エラーになる
#NoMethodError: undefined method `load_boards' for #<TODO::Application:0x00007fd24da9c190>
#Did you mean?  load_tasks
#tasksの方を求めている
# Rails.application.load_boards
