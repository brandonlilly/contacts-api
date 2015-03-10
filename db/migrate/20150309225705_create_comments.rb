class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.text :body
      t.string :commentable_type
    end

    add_index :comments, :commentable_id
  end
end
