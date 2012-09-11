class HomeController < ApplicationController
  def index
    redirect_to action: :login and return unless user && user.authenticated?
    @repos = session[:repos] = user.git_repos
  end

  def login
  end

  def update_repos
    if repos = params[:repos] && session[:repos]
      repos.each do |repo|
        unless Repo.where(gh_id: repo).first
          repo_data = session[:repos].find {|data| repo == data["id"].to_s }
          Repo.create(
            full_name: repo_data["name"],
            gh_id: repo_data["id"],
            user_id: user.id
          ).create_hook
        end
      end
    end
    redirect_to root_path
  end
end
