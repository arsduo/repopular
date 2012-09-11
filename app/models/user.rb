class User < ActiveRecord::Base
  attr_accessible :fb_id, :fb_token, :gh_id, :gh_token, :name

  class GitTokenMissing < StandardError; end
  def git_repos
    raise GitTokenMissing unless self.gh_token
    GH.with(token: gh_token) { GH["user/repos"] }
  end

  def facebook?
    !!fb_token
  end

  def github?
    !!gh_token
  end

  def authenticated?
    gh_token && fb_token
  end
end
