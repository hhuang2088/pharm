class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :patients, :email, unique: true
  end
end
