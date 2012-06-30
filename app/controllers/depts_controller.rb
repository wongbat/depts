class DeptsController < ApplicationController
  
  def index
    @depts = Dept.all

    respond_to do |format|
      format.html
      format.json { render :json => @depts }
    end
  end

  def show
    @dept = Dept.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @dept }
    end
  end
end
