class AddSkillLevelToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :skill_level, :string
  end
end
