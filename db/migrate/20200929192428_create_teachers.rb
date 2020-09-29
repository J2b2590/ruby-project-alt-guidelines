class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |table|
      table.string :first_name
      table.string :last_name

      table.timestamps
    end
  end
end
