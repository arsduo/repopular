class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :user_id
      t.string :full_name
      t.string :name

      t.timestamps
    end
  end
end
