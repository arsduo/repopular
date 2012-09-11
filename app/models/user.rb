class User < ActiveRecord::Base
  attr_accessible :fb_id, :fb_token, :gh_id, :gh_token, :name
end
