class SessionsController < ApplicationController
  def facebook
    Rails.logger.info "Whee!  Got some Facebook info!"
    Rails.logger.info request.env['omniauth.auth'].inspect
    render json: request.env['omniauth.auth']
  end

  def github
    Rails.logger.info "Whee!  Got some Github info!"
    Rails.logger.info request.env['omniauth.auth'].inspect
    render json: request.env['omniauth.auth']
  end
end
