class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :groups, :user_id

    create_table :groupings do |t|
      t.integer :group_id, null: false
      t.integer :contact_id, null: false

      t.timestamps
    end

    add_index :groupings, :group_id
    add_index :groupings, :contact_id
    add_index :groupings, [:group_id, :contact_id], unique: true
  end
end
