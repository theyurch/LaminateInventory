class CreateLaminates < ActiveRecord::Migration
  def change
    create_table :laminates do |t|
      t.string :color
      t.string :manufacturer
      t.string :grade
      t.string :bin
      t.string :job
      t.string :note
      t.integer :size1
      t.integer :size2

      t.timestamps
    end
  end
end
