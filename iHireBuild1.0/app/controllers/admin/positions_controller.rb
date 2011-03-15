class Admin::PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def add
    @p = Position.create
    session[:id] = position.id
  end

  def delete
  end

  def modify
    @p = Position.find(params[:id])
  end

end
