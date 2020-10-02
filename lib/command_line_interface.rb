require "pry"
require "tty-prompt"
require_relative "../lib/jeff_banner"
$VERBOSE = nil

class ScheduleApp

      
    def instrument_lessons_offered
        instrument_lessons_offered =[
            "Guitar",
            "Bass",
            "Voice",
            "Drums",
            "Violin"
        ]
    end 

    def skill_level
        skill_level = [
            "Beginner",
            "Intermediate",
            "Advanced"
        ]
    end

    def new_or_update
        new_or_update = [
            "New Student",
            "Update Info",
            "Exit"
        ]
    end

    def greet_enter_name

        jeff
        
       

        

        pastel = Pastel.new
        puts pastel.decorate("Enter Your First Name",:green, :on_black, :bold)
    
        @first = gets.chomp().downcase
        puts pastel.decorate("Enter Your Last Name",:green, :on_black, :bold)
        @last = gets.chomp().downcase

        @student = Student.find_or_create_by(first_name: @first, last_name: @last)

        puts  pastel.decorate("Hello #{@student.first_name.capitalize} #{@student.last_name.capitalize}",:green, :on_black, :bold)

        prompt = TTY::Prompt.new
        practice = prompt.select("Are you a new student or would you like to update info?", (new_or_update))

        if practice == "New Student" 
            creating_lesson
        elsif
            update_skill  
        elsif
            exit!
        end
        
    end

    def creating_lesson
        pastel = Pastel.new

        choices = Teacher.all.map do |teacher|
            {
                name:"#{teacher.first_name}"" ""#{teacher.last_name}", value: teacher
            }
        end

        puts "Lets get info from you #{@student.first_name.capitalize}"
        
        prompt = TTY::Prompt.new
        @user_instrument = pastel.decorate(prompt.select("what kind of instrument do you play?", (instrument_lessons_offered)),:green, :on_black, :bold)
        
        puts "How would you rate your skill level with #{@user_instrument}?"
        
        prompt = TTY::Prompt.new
        @user_skill = pastel.decorate(prompt.select("Skill", (skill_level)),:green, :on_black, :bold)

        prompt = TTY::Prompt.new
        @user_teacher = pastel.decorate(prompt.select("This is teachers", choices),:green, :on_black, :bold)
                
        puts "What day works best for you #{@student.first_name.capitalize} ?"
        @date = gets.chomp()

        puts "Great, so we are scheduled for a #{@user_skill} #{@user_instrument} lesson with #{@user_teacher.first_name} #{@user_teacher.last_name} on #{@date}"
        @created_lesson = Lesson.find_or_create_by(student_id: @student.id ,teacher_id: @user_teacher.id, instrument: "#{@user_instrument}", skill_level: "#{@user_skill}",date: "#{@date}")

    end

    

    def update_skill
        pastel = Pastel.new
        prompt = TTY::Prompt.new
        practice = prompt.yes?("have you been practicing?")
            if practice == true 
                prompt = TTY::Prompt.new
                @student.skill_level = prompt.select("Skills", (skill_level)) 
               
                @student.save
                puts pastel.decorate("Glad to hear you've been practicing,\nlets schedule a lesson!",:green, :on_black, :bold)
                # send to main ??
            else
                puts pastel.decorate("YOU BETTER PRACTICE,\nlets schedule a lesson",:red, :on_white, :bold)
                # send to main or close program
        end
        creating_lesson
    end



    def delete_or_keep_lesson
        pastel = Pastel.new
        prompt = TTY::Prompt.new
        keeping_lesson = prompt.yes?("Would you like to keep this lesson?")
        
        

        if keeping_lesson == true
            
           puts pastel.decorate("Have fun at your lesson,#{@student.first_name.capitalize}!",:green, :on_black, :bold)
          
        else
            @created_lesson.destroy
        end
        0.upto(9) do
            STDOUT.print "\rROCK N ROLL!"
            sleep 0.5
            STDOUT.print "\r                   " # Send return and six spaces
            sleep 0.5
          end
    end

    

end














