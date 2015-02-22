class Api::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def auth
    render nothing: true, status: 401 and return if params[:username].nil? || params[:password].nil?
    user = User.find_by({ username: params[:username] })
    render nothing: true, status: 401 and return if !user or !user.auth(params[:password])
  end
end