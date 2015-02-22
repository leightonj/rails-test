class Api::V1::SalesController < ApplicationController
  before_action :set_sale, only: [:show, :destroy]
  
  private
  
  def set_sale
    @sale = Sale.find(params[:id])
  end
end