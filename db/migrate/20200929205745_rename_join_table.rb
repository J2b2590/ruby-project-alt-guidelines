class RenameJoinTable < ActiveRecord::Migration[5.2]
  def change
    
        rename_table :students_teachers, :lessons
        
  end
end
