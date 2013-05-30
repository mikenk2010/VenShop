class CheckoutsController < ApplicationController
  def new
  end

  def index
    flash[:success] = "Check out"
  end

  def create
    flash[:success] = "Fill form"
  end

  def hienthi
  end

  def update
  end

  def show
    flash[:success] = "Success shopping - See you again"
  end
end
