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

  def new
    @dept = Dept.new

    respond_to do |format|
      format.html
      format.json { render :json => @dept }
    end
  end

  def create
    @dept = Dept.new(params[:id])

    respond_to do |format|
      if @dept.save(params[:id])
         format.html { redirect_to :action => 'index' }
         format.json { render :json => @dept }

      else
         format.html { render :action => 'new' }
         format.json { render :json => @dept }
      end
    end
  end

  def edit
    @dept = Dept.find(params[:id])
  end

  def update
    @dept = Dept.find(params[:id])

    respond_to do |format|
      if @dept.update_attributes(params[:id])
         format.html { redirect_to :action => 'show', :id => @dept }
         format.json { render :json => @dept }

      else
         format.html { redirect_to :action => 'edit' }
         format.json { render :json => @dept }
      end
    end
  end

  def destroy
    @dept = Dept.find(params[:id])
    @dept.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render :json => @dept }
    end
  end
end
