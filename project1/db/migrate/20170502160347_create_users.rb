class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :dob
      t.string :picture
      t.string :gender

      t.timestamps null: false
    end
  end
end
