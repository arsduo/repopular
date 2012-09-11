class AddRemoteIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :gh_id, :integer
  end
end
