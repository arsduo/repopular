class Repo < ActiveRecord::Base
  attr_accessible :full_name, :name, :user_id
end
