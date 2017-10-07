# User model
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.belongs_to :role

      t.timestamps
    end
  end
end
