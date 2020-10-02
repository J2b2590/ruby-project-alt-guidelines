Student.destroy_all
Teacher.destroy_all
Lesson.destroy_all


teacher1 = Teacher.create first_name: "Philip", last_name:"Glass"
teacher2 = Teacher.create first_name: "Ozzy",last_name:"Osborne"
teacher3 = Teacher.create first_name: "Van",last_name:"Halen"
teacher4 = Teacher.create first_name: "Les",last_name:"Claypool"
teacher5 = Teacher.create first_name: "Franz",last_name:"Listz"


student1 = Student.create first_name: "Jimmy", last_name:"Lee", skill_level: "beginner"
student2 = Student.create first_name: "Joe", last_name:"Jackson", skill_level: "beginner"
student3 = Student.create first_name: "Lenard",last_name: "Cohen", skill_level: "beginner"
student4 = Student.create first_name: "Fred",last_name: "Turner", skill_level: "beginner"
student5 = Student.create first_name: "Bo", last_name:"Diddly", skill_level: "beginner"


lesson1 = Lesson.create student_id: student1.id, teacher_id: teacher1.id, instrument: "Guitar", skill_level: "Beginner", date: "4/4/20"
lesson2 = Lesson.create student_id: student2.id, teacher_id: teacher2.id, instrument: "Sitar", skill_level: "Advanced", date: "5/3/20"
lesson3 = Lesson.create student_id: student3.id, teacher_id: teacher3.id, instrument: "Banjo", skill_level: "Intermediate", date: "6/4/20"
lesson4 = Lesson.create student_id: student4.id, teacher_id: teacher4.id, instrument: "Tuba", skill_level: "Advanced", date: "4/26/20"
lesson5 = Lesson.create student_id: student5.id, teacher_id: teacher5.id, instrument: "Trumpet", skill_level: "Beginner", date: "1/9/20"
lesson6 = Lesson.create student_id: student1.id, teacher_id: teacher3.id, instrument: "Voice", skill_level: "Intermediate", date: "7/2/20"
lesson7 = Lesson.create student_id: student2.id, teacher_id: teacher2.id, instrument: "Hurdy Gurdy", skill_level: "Beginner", date: "8/12/20"

