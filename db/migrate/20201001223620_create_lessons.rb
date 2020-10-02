class CreateLessons < ActiveRecord::Migration[5.2]
  def change
      create_table :lessons do |table|
      table.integer :student_id
      table.integer :teacher_id

      table.string :instrument
      table.string :skill_level
      table.string :date

      table.timestamps
    end
  end
end
