class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :nickname
      t.string :subject
      t.string :school, null: false
      t.string :image

      t.timestamps null: false
    end
  end
end
