class Api::V1::SalesController < ApplicationController
  before_action :authorize
  before_action :set_sale, only: [:show, :destroy]
  
  def create
    @sales = []
    errors = []
    params[:sales] = [params[:sale]] if params[:sale]

    params[:sales].each do |s|
      sale = Sale.new(s.permit(:sale_ts, :code, :value))
      @sales.push sale
      errors.push sale.errors if !sale.save
    end

    if errors.empty?
      render :create, status: :created
    else
      render json: errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @sale.destroy
    head :no_content
  end
  
  private
  
  def set_sale
    @sale = Sale.find(params[:id])
  end
  
  def authorize
    @user = User.find_by(access_key: params[:access_key])
    render nothing: true, status: 403 if @user.nil?
  end
end