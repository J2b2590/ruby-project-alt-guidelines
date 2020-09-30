require "pry"
require "tty-prompt"
$VERBOSE = nil

@@instrument_lessons_offered =[
    "Guitar",
    "Bass",
    "Voice",
    "Drums",
    "Violin"
]

@@skill_level = [
    "Beginner",
    "Intermediate",
    "Advanced"
]

def greet_enter_name
    
    puts "Enter your first name"
    first = gets.chomp().downcase
    puts "Please Enter your Last"
    last = gets.chomp().downcase

    @student = Student.find_or_create_by(first_name: first, last_name: last)
    
    puts  "Hello #{@student.first_name.capitalize} #{@student.last_name.capitalize}"

end

def creating_lesson
    

    choices = Teacher.all.map do |teacher|
        {
            name:"#{teacher.first_name}"" ""#{teacher.last_name}", value: teacher
        }
    end


    puts "Lets get info from you #{@student.first_name.capitalize}"
    
    prompt = TTY::Prompt.new
    @user_instrument = prompt.select("what kind of instrument do you play?", (@@instrument_lessons_offered))
    
    puts "How would you rate your skill level with #{@user_instrument}?"
    
    prompt = TTY::Prompt.new
    @user_skill = prompt.select("Skill", (@@skill_level))

    prompt = TTY::Prompt.new
    @user_teacher = prompt.select("This is teachers", choices)
              
    puts "What day works best for you #{@student.first_name.capitalize} ?"
    @date = gets.chomp()

    puts "Great, so we are scheduled for a #{@user_skill} #{@user_instrument} lesson with #{@user_teacher.first_name} on #{@date}"
    created_lesson = Lesson.find_or_create_by(student_id: @student.id ,teacher_id: @user_teacher.id, instrument: "#{@user_instrument}", skill_level: "#{@user_skill}",date: "#{@date}")

end


   
