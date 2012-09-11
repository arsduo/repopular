class SessionsController < ApplicationController
  def facebook
    unless @user = User.where(fb_id: auth_hash["uid"]).first
      @user = User.create(
        name: auth_hash["name"],
        fb_id: auth_hash["uid"],
        fb_token: auth_hash["credentials"]["token"]
      )
    end

    session[:user] = @user
    setup_github_data if gh_data

    Rails.logger.debug("Logged in user #{@user.fb_id}")

    redirect_to "/"
  end

  def github
    unless @user = session[:user]
      session[:gh_data] = auth_hash
      redirect_to "/auth/facebook"
    end

    setup_gh_data

    redirect_to "/"
  end

  private

  def setup_gh_data
    @user.update_attributes(
      gh_id: gh_data["uid"],
      gh_token: gh_data["credentials"]["token"]
    )
    session[:gh_data] = nil
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def fb_data
    auth_hash["provider"] == "facebook" && auth_hash
  end

  def gh_data
    session[:gh_data] || (auth_hash["provider"] == "github" && auth_hash)
  end
end

