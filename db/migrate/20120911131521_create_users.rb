class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :fb_id
      t.string :fb_token
      t.string :gh_id
      t.string :gh_token

      t.timestamps
    end

    add_index :users, :fb_id, unique: true
    add_index :users, :gh_id, unique: true
  end
end
