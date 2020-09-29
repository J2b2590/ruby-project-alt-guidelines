class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :teachers, table_name: :lessons do |table|
      table.index :student_id
      table.index :teacher_id

      table.string :instrument
      table.string :skill_level
      table.string :date

      table.timestamps
    end
  end
end
