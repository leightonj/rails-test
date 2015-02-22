class Api::V1::SalesController < ApplicationController
  before_action :authorize
  before_action :set_sale, only: [:show, :destroy]
  
  private
  
  def set_sale
    @sale = Sale.find(params[:id])
  end
  
  def authorize
    @user = User.find_by(access_key: params[:access_key])
    render nothing: true, status: 403 if @user.nil?
  end
end