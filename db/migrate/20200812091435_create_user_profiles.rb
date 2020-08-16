class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.text :about_me
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
