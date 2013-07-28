class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.references :user_id
      t.references :skill_id
      t.integer :rating
      t.timestamps
    end
  end
end
