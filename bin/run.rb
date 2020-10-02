require_relative '../config/environment'
require_relative '../lib/command_line_interface.rb'



app = ScheduleApp.new 

app.greet_enter_name

app.delete_or_keep_lesson


