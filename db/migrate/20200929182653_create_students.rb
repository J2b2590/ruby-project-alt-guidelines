class CreateStudents < ActiveRecord::Migration[5.2]
  def change 
    create_table :students do |table|
      table.string :first_name
      table.string :last_name

      table.timestamps
    end
  end
end

